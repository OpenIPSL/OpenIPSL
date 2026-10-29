# Build project for the IEEE/CIGRE DLL ("real code") model libraries of OpenIPSL.
#
# Each model library is one shared library = the model source (written to the IEEE/CIGRE DLL Modeling
# Standard, API V2) + the generic OpenIPSL adapter (src/oipsl_cigre_adapter.c) compiled with
# -DOIPSL_PREFIX=<Name>:
#   SCRX9        Windows: SCRX9.dll + SCRX9.lib              Linux: libSCRX9.so
#   GFM_GFL_IBR  Windows: GFM_GFL_IBR.dll + GFM_GFL_IBR.lib  Linux: libGFM_GFL_IBR.so
# "cmake --install" copies them to <prefix>/Library/<platform>, where <platform> is win64, win32, linux64,
# linux32 or darwin64 and the default <prefix> is OpenIPSL/Resources, i.e. the files land in
# OpenIPSL/Resources/Library/<platform>/, the folder that the Modelica annotation
# LibraryDirectory="modelica://OpenIPSL/Resources/Library" points to.
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

project(OpenIPSL_IEEE_CIGRE VERSION 1.0.0 LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

get_property(_oipsl_multi_config GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT _oipsl_multi_config AND NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# Platform folder names of the Modelica specification (section 12.9.4 of MLS 3.6)
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(_oipsl_bits 64)
else()
  set(_oipsl_bits 32)
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
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

# Libraries and test programs side by side, so that the tests find the DLLs on Windows
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

if(MSVC)
  set(_oipsl_warnings /W4 /utf-8)
else()
  set(_oipsl_warnings -Wall -Wextra)
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
  install(TARGETS ${name}
    RUNTIME DESTINATION "${OIPSL_INSTALL_DIR}"
    LIBRARY DESTINATION "${OIPSL_INSTALL_DIR}"
    ARCHIVE DESTINATION "${OIPSL_INSTALL_DIR}")

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

message(STATUS "IEEE/CIGRE libraries install into ${CMAKE_INSTALL_PREFIX}/${OIPSL_INSTALL_DIR}")
