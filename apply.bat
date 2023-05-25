@echo off
CHCP 65001>NUL

echo.&echo Wait..
md "C:\Users\%UserName%\AppData\Local\PopCatTrushIco"                    2>nul >nul
copy empty.ico "C:\Users\%UserName%\AppData\Local\PopCatTrush\empty.ico" 2>nul >nul
copy full.ico "C:\Users\%UserName%\AppData\Local\PopCatTrush\full.ico"   2>nul >nul

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V empty /D "%USERPROFILE%\AppData\Local\PopCatTrush\empty.ico" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /V full  /D "%USERPROFILE%\AppData\Local\PopCatTrush\full.ico"  /T REG_EXPAND_SZ /F 2>nul >nul

ie4uinit.exe -show                                                                                     2>nul >nul
PowerShell @^(^(New-Object -com shell.application^).Windows^(^)^).Document.Folder.Self.Path >> "%temp%\paths.txt"
TaskKill /F /IM Explorer.exe                                                                           2>nul >nul
Start Explorer.exe                                                                                     2>nul >nul
TaskKill /F /IM Explorer.exe                                                                           2>nul >nul
Start Explorer.exe                                                                                     2>nul >nul
ie4uinit.exe -show                                                                                     2>nul >nul
TaskKill /F /IM Explorer.exe                                                                           2>nul >nul
Start Explorer.exe                                                                                     2>nul >nul
ie4uinit.exe -show                                                                                     2>nul >nul
FOR /F "tokens=*" %%f IN (%temp%\paths.txt) DO (
set "var=%%f"
set "firstletters=!var:~0,2!"
IF "!firstletters!" == "::" ( start /min shell:%%~f ) ELSE ( start /min "" "%%~f" )
) 2>nul >nul
DEL /q "%temp%\paths.txt"                                                                              2>nul >nul
ie4uinit.exe -show                                                                                     2>nul >nul
cls&echo.&echo Done!&echo.
pause