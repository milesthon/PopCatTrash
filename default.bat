@echo off
CHCP 65001>NUL

echo.&echo Wait..
for /f "tokens=2" %%a in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /ve') do set DefaultValue=%%a

if "%DefaultValue%"=="-45" (
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V empty /D "%SystemRoot%\System32\imageres.dll,-55" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V full  /D "%SystemRoot%\System32\imageres.dll,-54" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /VE      /D "%SystemRoot%\System32\imageres.dll,-54" /T REG_EXPAND_SZ /F 2>nul >nul
) else (
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V empty /D "%SystemRoot%\System32\imageres.dll,-55" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V full  /D "%SystemRoot%\System32\imageres.dll,-54" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /VE      /D "%SystemRoot%\System32\imageres.dll,-55" /T REG_EXPAND_SZ /F 2>nul >nul
)

rd /s /q "%USERPROFILE%\AppData\Local\PopCatTrushIco" 2>nul >nul

ie4uinit.exe -show 2>nul >nul

cls&echo.&echo Done! You may need to log out or restart the PC.&echo.
pause