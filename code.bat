@echo off
setlocal enabledelayedexpansion

if NOT "%UE_SDKS_ROOT%"=="" (
    call "%UE_SDKS_ROOT%\HostWin64\Android\SetupEnvironmentVars.bat"
)

set ANDROIDHOME=%ANDROID_HOME%
if "%ANDROIDHOME%"=="" set ANDROIDHOME=C:\Users\chru\AppData\Local\Android\Sdk

set ADB="%ANDROIDHOME%\platform-tools\adb.exe"

if not exist %ADB% (
    echo missing
    exit /b 1
)

set "folder_path=C:\[这里填写迁移出的目标路径]"

for %%i in ("%folder_path%\*") do (
    set "LOCAL_FILE_PATH=%%i"
    set "ANDROID_DEST_PATH=/sdcard/[这里填写迁移到的目标路径]"

    %ADB% push "!LOCAL_FILE_PATH!" "!ANDROID_DEST_PATH!"

    if not errorlevel 1 (
        echo !LOCAL_FILE_PATH!
        echo success
    ) else (
        echo !LOCAL_FILE_PATH!
        echo error
    )
)

@pause

endlocal
