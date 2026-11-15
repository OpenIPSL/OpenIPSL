@echo off
rem Builds, tests and installs the IEEE/CIGRE model libraries of OpenIPSL for win64 with MSVC (static CRT, /MT).
rem Result: ..\..\Library\win64\{SCRX9,GFM_GFL_IBR}.{dll,lib}
rem
rem Usage: build_win64.bat [build folder]
rem   Default build folder: %TEMP%\cigre_build\win64. Keep it outside Dropbox/OneDrive-synchronised folders.
rem   Set VCVARSALL to use another Visual Studio installation (default: Visual Studio 2026 (v18) Community).
rem Needs: Visual Studio 2022 or later with the C++ workload and its component "C++ CMake tools for Windows"
rem (CMake and Ninja), or any CMake 3.20 or newer on PATH.
rem
rem Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
rem BSD 3-Clause License, see the LICENSE file of OpenIPSL.
setlocal
set "SOURCE_DIR=%~dp0."
set "BUILD_DIR=%~1"
if "%BUILD_DIR%"=="" set "BUILD_DIR=%TEMP%\cigre_build\win64"
if "%VCVARSALL%"=="" set "VCVARSALL=C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat"

rem vcvarsall.bat calls vswhere.exe, which lives in the Visual Studio Installer folder (not on PATH by default)
set "PATH=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer;%PATH%"
call "%VCVARSALL%" x64
where cl.exe >nul 2>nul || (echo cl.exe not found: check VCVARSALL & exit /b 1)
where cmake.exe >nul 2>nul || (echo cmake.exe not found: install the component "C++ CMake tools for Windows" of Visual Studio & exit /b 1)
set "GENERATOR=Ninja"
where ninja.exe >nul 2>nul || set "GENERATOR=NMake Makefiles"

cmake -S "%SOURCE_DIR%" -B "%BUILD_DIR%" -G "%GENERATOR%" -DCMAKE_BUILD_TYPE=Release || exit /b 1
cmake --build "%BUILD_DIR%" --config Release || exit /b 1
ctest --test-dir "%BUILD_DIR%" -C Release --output-on-failure || exit /b 1
cmake --install "%BUILD_DIR%" --config Release || exit /b 1
endlocal
