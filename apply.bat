@echo off
CHCP 65001>NUL

echo.&echo Wait..
md "C:\Users\%UserName%\AppData\Local\PopCatTrushIco"                              2>nul >nul
copy "%~dp0empty.ico" "C:\Users\%UserName%\AppData\Local\PopCatTrushIco\empty.ico" 2>nul >nul
copy "%~dp0full.ico" "C:\Users\%UserName%\AppData\Local\PopCatTrushIco\full.ico"   2>nul >nul

for /f "tokens=2" %%a in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /ve') do set DefaultValue=%%a

if "%DefaultValue%"=="-45" (
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V empty /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\empty.ico" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V full  /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\full.ico"  /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /VE      /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\full.ico"  /T REG_EXPAND_SZ /F 2>nul >nul
) else (
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V empty /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\empty.ico" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V full  /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\full.ico"  /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /VE      /D "%USERPROFILE%\AppData\Local\PopCatTrushIco\empty.ico" /T REG_EXPAND_SZ /F 2>nul >nul
)

ie4uinit.exe -show 2>nul >nul
pause