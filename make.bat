@echo off
@rem "Makefile" for Windows OSP projects.
@rem Copyright (c) Philip Conrad, 2015. All rights reserved.
@rem
@rem Distributed under the MIT License.
@rem See http://opensource.org/licenses/MIT for license details.
@rem
SETLOCAL

@rem ###############
@rem # PRINT USAGE #
@rem ###############

if [%1]==[] goto usage


@rem ################
@rem # SWITCH BLOCK #
@rem ################

@rem  make build
if /I [%1]==[build] call :build

@rem  make run
if /I [%1]==[run] call :run

@rem  make gui
if /I [%1]==[gui] call :gui

@rem  make demo
if /I [%1]==[demo] call :demo

@rem  make debug
if /I [%1]==[debug] call :debug

@rem  make clean
if /I [%1]==[clean] call :clean

goto :eof


@rem #############
@rem # FUNCTIONS #
@rem #############
:build
@javac -g -classpath .;OSP.jar; -d . *.java
exit /B %ERRORLEVEL%

:run
call :build && @java -classpath .;OSP.jar osp.OSP -noGUI
exit /B 0

:gui
call :build && @java -classpath .;OSP.jar osp.OSP
exit /B 0

:demo
@java -classpath .;Demo.jar osp.OSP
exit /B 0

:debug
@jdb -classpath .;OSP.jar osp.OSP
exit /B 0

:clean
@del /S /F /Q osp temp *.log saved
exit /B 0


:usage
@echo Usage: %0 ^[ build ^| run ^| gui ^| demo ^| debug ^| clean ^]
exit /B 1