# Build project for the IEEE/CIGRE DLL ("real code") model libraries of OpenIPSL.
#
# Each model library is one shared library = the model source (written to the IEEE/CIGRE DLL Modeling
# Standard, API V2) + the generic OpenIPSL adapter (src/oipsl_cigre_adapter.c) compiled with
# -DOIPSL_PREFIX=<Name>:
#   SCRX9        Windows: SCRX9.dll + SCRX9.lib              Linux: libSCRX9.so        macOS: libSCRX9.a
#   GFM_GFL_IBR  Windows: GFM_GFL_IBR.dll + GFM_GFL_IBR.lib  Linux: libGFM_GFL_IBR.so  macOS: libGFM_GFL_IBR.a
# "cmake --install" copies them to <prefix>/Library/<platform>, where <platform> is win64, win32, linux64,
# linux32 or darwin64 on x86, aarch64-linux or aarch64-darwin on 64-bit ARM, and the default <prefix> is
# OpenIPSL/Resources, i.e. the files land in
# OpenIPSL/Resources/Library/<platform>/, the folder that the Modelica annotation
# LibraryDirectory="modelica://OpenIPSL/Resources/Library" points to. On Apple Silicon the install also
# copies the archives to Library/arm64-darwin, because OpenModelica searches <processor>-<os> with Apple's
# processor name (arm64-darwin) while System Modeler searches aarch64-darwin (measured 2026-10-31). macOS gets
# static archives (with renamed Model_* entry points) instead of dylibs, because neither tool's simulation
# executable carries an rpath to the library folder (see oipsl_add_cigre_library).
#
#   cmake -S . -B <build> -DCMAKE_BUILD_TYPE=Release
#   cmake --build <build> --config Release
#   ctest --test-dir <build> -C Release --output-on-failure
#   cmake --install <build> --config Release [--prefix <stage>]
# (CMake 3.20 or newer: ctest --test-dir needs it.)
#
# See README.md (build_win64.bat, build_linux64.sh). Build outside folders synchronised by Dropbox, OneDrive
# and the like: their file locks break compilers and linkers at random.
#
# Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
# BSD 3-Clause License, see the LICENSE file of OpenIPSL.

cmake_minimum_required(VERSION 3.20)

# Static C runtime on MSVC (/MT): the DLLs then depend on KERNEL32.dll only, no Visual C++ redistributable.
if(POLICY CMP0091)
  cmake_policy(SET CMP0091 NEW)
endif()
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

# macOS: the archives run on macOS 11.0 (the first release for Apple Silicon) and later, not only on the build
# host's release. Ignored on other systems; -DCMAKE_OSX_DEPLOYMENT_TARGET=<version> overrides it.
set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "Minimum macOS version of the libraries")

project(OpenIPSL_IEEE_CIGRE VERSION 1.0.0 LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

get_property(_oipsl_multi_config GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT _oipsl_multi_config AND NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# Platform folder names: those of the Modelica specification (section 12.9.4 of MLS 3.6) on x86, and the
# <processor>-<os> names that OpenModelica (OPENMODELICA_SPEC_PLATFORM) and the FMI 3.0 platform tuples use on
# 64-bit ARM, aarch64-linux and aarch64-darwin (Apple Silicon). The pointer size decides, not the processor name:
# a 32-bit armhf build on a 64-bit kernel reports CMAKE_SYSTEM_PROCESSOR aarch64 (Raspberry Pi OS 32-bit on a
# Pi 4/400, measured 2026-11-01) and belongs in linux32
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(_oipsl_bits 64)
else()
  set(_oipsl_bits 32)
endif()
if(CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$" AND CMAKE_SYSTEM_NAME MATCHES "^(Linux|Darwin)$" AND CMAKE_SIZEOF_VOID_P EQUAL 8)
  string(TOLOWER "${CMAKE_SYSTEM_NAME}" _oipsl_os)
  set(_oipsl_platform "aarch64-${_oipsl_os}")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
  set(_oipsl_platform "win${_oipsl_bits}")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(_oipsl_platform "linux${_oipsl_bits}")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(_oipsl_platform "darwin64")
else()
  message(FATAL_ERROR "No Modelica platform folder name known for CMAKE_SYSTEM_NAME ${CMAKE_SYSTEM_NAME}")
endif()
set(OIPSL_PLATFORM "${_oipsl_platform}" CACHE STRING "Platform folder below Resources/Library")

# Default install prefix: OpenIPSL/Resources (this folder is OpenIPSL/Resources/C-Sources/IEEE_CIGRE)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  get_filename_component(_oipsl_resources "${CMAKE_CURRENT_SOURCE_DIR}/../.." ABSOLUTE)
  set(CMAKE_INSTALL_PREFIX "${_oipsl_resources}" CACHE PATH "Installs into <prefix>/Library/<platform>" FORCE)
endif()
set(OIPSL_INSTALL_DIR "Library/${OIPSL_PLATFORM}")
# OpenModelica on Apple Silicon looks in arm64-darwin (its OPENMODELICA_SPEC_PLATFORM, with Apple's processor name),
# System Modeler only in aarch64-darwin (measured 2026-10-31): the archives go into both. Two copies, not a link,
# so that the folders also survive a checkout on Windows.
set(OIPSL_INSTALL_DIRS "${OIPSL_INSTALL_DIR}")
if(OIPSL_PLATFORM STREQUAL "aarch64-darwin")
  list(APPEND OIPSL_INSTALL_DIRS "Library/arm64-darwin")
endif()

# Reproducible static archives on macOS: ar records the build time in every archive member; Apple's ranlib -D
# rewrites the archive with zero time stamps
if(APPLE)
  set(CMAKE_C_ARCHIVE_FINISH "<CMAKE_RANLIB> -D -no_warning_for_no_symbols -c <TARGET>")
endif()

# Libraries and test programs side by side, so that the tests find the DLLs on Windows
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

if(MSVC)
  set(_oipsl_warnings /W4 /utf-8)
else()
  set(_oipsl_warnings -Wall -Wextra)
endif()

# No floating-point contraction: clang (and gcc outside ISO C mode) fuses a*b+c into one fused multiply-add
# wherever the target has it (every 64-bit ARM; x86-64 only with -mfma). The fused result is rounded once
# instead of twice, so the same C source gives different last bits on ARM and on x86-64. Measured on Apple
# Silicon (2026-10-31): GFM_GFL_IBR's start-up transient amplifies that to a visibly different trajectory
# (P off by up to 2.6 Sbase in the first 0.4 s of the GFL tests, several extra current-zero events), while with
# -ffp-contract=off the ARM results equal the x86-64 ones to 2e-9 relative, the same as Linux against Windows.
# MSVC does not contract under its default /fp:precise.
if(NOT MSVC)
  list(APPEND _oipsl_warnings -ffp-contract=off)
endif()

# oipsl_target_settings(<target>): reproducible MSVC builds (/Brepro: no time stamps in the PE files, so a
# rebuild of the same sources gives bit-identical DLLs and import libraries)
function(oipsl_target_settings target)
  if(MSVC)
    target_compile_options(${target} PRIVATE /Brepro)
    target_link_options(${target} PRIVATE /Brepro)
  endif()
endfunction()

enable_testing()

# oipsl_add_cigre_library(<Name> <model source>): shared library <Name> and its tests adapter_test_<Name> and
# layout_test_<Name>
function(oipsl_add_cigre_library name source)
  add_library(${name} SHARED "src/${source}" src/oipsl_cigre_adapter.c)
  target_include_directories(${name} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
  target_compile_definitions(${name} PRIVATE OIPSL_PREFIX=${name})
  target_compile_options(${name} PRIVATE ${_oipsl_warnings})
  set_target_properties(${name} PROPERTIES
    C_VISIBILITY_PRESET hidden
    POSITION_INDEPENDENT_CODE ON)
  if(WIN32)
    # Same names with MSVC and MinGW: <Name>.dll and the import library <Name>.lib
    set_target_properties(${name} PROPERTIES PREFIX "" IMPORT_PREFIX "" IMPORT_SUFFIX ".lib")
  endif()
  if(UNIX)
    target_link_libraries(${name} PRIVATE m)
  endif()
  # ELF: -Bsymbolic binds the adapter's calls to the Model_* entry points of its own library. Every
  # IEEE/CIGRE library exports the same Model_* names; without it, ELF symbol interposition makes the adapter
  # of the second library loaded into a process call the Model_* functions of the first one. Windows DLLs
  # bind their internal calls at link time and are not affected.
  if(UNIX AND NOT APPLE)
    target_link_options(${name} PRIVATE "LINKER:-Bsymbolic")
  endif()
  oipsl_target_settings(${name})
  if(APPLE)
    # macOS installs a static archive lib<Name>.a instead of the dylib (the dylib is still built for the C tests).
    # Neither System Modeler's nor OpenModelica's simulation executable has an LC_RPATH to the library folder, and
    # OpenModelica starts it through /bin/sh, which drops DYLD_LIBRARY_PATH, so a dylib would only load with an
    # absolute install name, the path of one machine (measured 2026-10-31 and 2026-11-01). An archive is linked
    # into the executable and needs nothing at run time. The standard's eight Model_* entry points are renamed
    # <Name>_Model_* in it, so that a model using two of these libraries links both archives without duplicate
    # symbols; the adapter calls the renamed functions of its own model.
    set(_oipsl_renames "")
    foreach(_oipsl_entry IN ITEMS GetInfo CheckParameters Initialize Outputs FirstCall Iterate Terminate PrintInfo)
      list(APPEND _oipsl_renames "Model_${_oipsl_entry}=${name}_Model_${_oipsl_entry}")
    endforeach()
    add_library(${name}_static STATIC "src/${source}" src/oipsl_cigre_adapter.c)
    target_include_directories(${name}_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
    target_compile_definitions(${name}_static PRIVATE OIPSL_PREFIX=${name} ${_oipsl_renames})
    target_compile_options(${name}_static PRIVATE ${_oipsl_warnings})
    set_target_properties(${name}_static PROPERTIES
      OUTPUT_NAME ${name}
      C_VISIBILITY_PRESET hidden
      POSITION_INDEPENDENT_CODE ON)
    # install(FILES), not install(TARGETS): the latter runs ranlib again on the installed archive on Apple, which
    # writes the install time into its table of contents
    foreach(_oipsl_dir IN LISTS OIPSL_INSTALL_DIRS)
      install(FILES "$<TARGET_FILE:${name}_static>" DESTINATION "${_oipsl_dir}")
    endforeach()
  else()
    install(TARGETS ${name}
      RUNTIME DESTINATION "${OIPSL_INSTALL_DIR}"
      LIBRARY DESTINATION "${OIPSL_INSTALL_DIR}"
      ARCHIVE DESTINATION "${OIPSL_INSTALL_DIR}")
  endif()

  add_executable(adapter_test_${name} test/adapter_test.c)
  target_include_directories(adapter_test_${name} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
  target_compile_definitions(adapter_test_${name} PRIVATE OIPSL_PREFIX=${name} IEEE_CIGRE_IMPORT OIPSL_TEST_${name})
  target_compile_options(adapter_test_${name} PRIVATE ${_oipsl_warnings})
  target_link_libraries(adapter_test_${name} PRIVATE ${name})
  if(UNIX)
    target_link_libraries(adapter_test_${name} PRIVATE m)
  endif()
  oipsl_target_settings(adapter_test_${name})
  add_test(NAME adapter_test_${name} COMMAND adapter_test_${name})

  # Layout test: compiles the model source itself (entry points renamed, nothing exported) and compares
  # offsetof/sizeof of its private input, output and parameter structures with the layout that the adapter in
  # the library computes from Model_GetInfo(), with this compiler.
  add_executable(layout_test_${name} test/layout_test.c)
  target_include_directories(layout_test_${name} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include"
                                                         "${CMAKE_CURRENT_SOURCE_DIR}/src")
  target_compile_definitions(layout_test_${name} PRIVATE OIPSL_PREFIX=${name} OIPSL_TEST_${name})
  target_compile_options(layout_test_${name} PRIVATE ${_oipsl_warnings})
  target_link_libraries(layout_test_${name} PRIVATE ${name})
  if(UNIX)
    target_link_libraries(layout_test_${name} PRIVATE m)
  endif()
  oipsl_target_settings(layout_test_${name})
  add_test(NAME layout_test_${name} COMMAND layout_test_${name})
endfunction()

oipsl_add_cigre_library(SCRX9 SCRX9.c)
oipsl_add_cigre_library(GFM_GFL_IBR GFM_GFL_IBR.c)

# Two libraries in one program, linked in both orders, as a Modelica tool links them when one model uses both:
# each adapter must drive its own model (the -Bsymbolic note in oipsl_add_cigre_library).
foreach(_oipsl_order IN ITEMS scrx9_first gfm_first)
  add_executable(two_libraries_test_${_oipsl_order} test/two_libraries_test.c)
  target_include_directories(two_libraries_test_${_oipsl_order} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
  target_compile_definitions(two_libraries_test_${_oipsl_order} PRIVATE IEEE_CIGRE_IMPORT)
  target_compile_options(two_libraries_test_${_oipsl_order} PRIVATE ${_oipsl_warnings})
  if(_oipsl_order STREQUAL "scrx9_first")
    target_link_libraries(two_libraries_test_${_oipsl_order} PRIVATE SCRX9 GFM_GFL_IBR)
  else()
    target_link_libraries(two_libraries_test_${_oipsl_order} PRIVATE GFM_GFL_IBR SCRX9)
  endif()
  oipsl_target_settings(two_libraries_test_${_oipsl_order})
  add_test(NAME two_libraries_test_${_oipsl_order} COMMAND two_libraries_test_${_oipsl_order})
endforeach()

# The static archives in one program, in both orders: the renamed entry points must not collide
if(APPLE)
  foreach(_oipsl_order IN ITEMS scrx9_first gfm_first)
    add_executable(two_archives_test_${_oipsl_order} test/two_libraries_test.c)
    target_include_directories(two_archives_test_${_oipsl_order} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
    target_compile_options(two_archives_test_${_oipsl_order} PRIVATE ${_oipsl_warnings})
    if(_oipsl_order STREQUAL "scrx9_first")
      target_link_libraries(two_archives_test_${_oipsl_order} PRIVATE SCRX9_static GFM_GFL_IBR_static m)
    else()
      target_link_libraries(two_archives_test_${_oipsl_order} PRIVATE GFM_GFL_IBR_static SCRX9_static m)
    endif()
    add_test(NAME two_archives_test_${_oipsl_order} COMMAND two_archives_test_${_oipsl_order})
  endforeach()
endif()

foreach(_oipsl_dir IN LISTS OIPSL_INSTALL_DIRS)
  message(STATUS "IEEE/CIGRE libraries install into ${CMAKE_INSTALL_PREFIX}/${_oipsl_dir}")
endforeach()
