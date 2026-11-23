@echo off
setlocal
chcp 65001 >nul

rem 修改这两项，路径两边的双引号要保留
set "SOURCE=D:\VS_Code_Workspace\BLOODBORNE_PC_QOL_EASY_MODE\param\gameparam\gameparam.parambnd.dcx"
set "DEST_DIR=E:\Bloodborne PC Windows\bb_mods\QOL_EASY_MODE\dvdroot_ps4\param\gameparam"

if not exist "%SOURCE%" (
    echo [失败] 找不到源文件：
    echo "%SOURCE%"
    echo.
    pause
    exit /b 1
)

if not exist "%DEST_DIR%\" (
    echo [失败] 目标文件夹不存在：
    echo "%DEST_DIR%"
    echo.
    echo 请检查路径，避免把文件复制到错误位置。
    pause
    exit /b 1
)

echo 正在复制：
echo "%SOURCE%"
echo 到：
echo "%DEST_DIR%\"
echo.

copy /Y /B "%SOURCE%" "%DEST_DIR%\" >nul

if errorlevel 1 (
    echo [失败] 复制未完成。请检查目标文件是否被占用，或是否有写入权限。
    echo.
    pause
    exit /b 1
)

echo [成功] 文件已复制并覆盖。
echo.
timeout /t 2 >nul
exit /b 0