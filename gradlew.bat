@echo off
setlocal
set VERSION=8.6
if "%GRADLE_USER_HOME%"=="" set GRADLE_USER_HOME=%USERPROFILE%\.gradle
set BASE=%GRADLE_USER_HOME%\bootstrap\gradle-%VERSION%
set BIN=%BASE%\gradle-%VERSION%\bin\gradle.bat
if not exist "%BIN%" (
  if not exist "%BASE%" mkdir "%BASE%"
  set ZIP=%TEMP%\gradle-%VERSION%-bin.zip
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip' -OutFile '%TEMP%\gradle-%VERSION%-bin.zip'; Expand-Archive -Force '%TEMP%\gradle-%VERSION%-bin.zip' '%BASE%'"
  if errorlevel 1 exit /b 1
)
call "%BIN%" %*
exit /b %ERRORLEVEL%
