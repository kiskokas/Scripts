@Echo off
xcopy D:\Images F:\Images /d/e/c/h/r/k/y
xcopy D:\Images D:\Archive_Pictures /d/e/c/h/r/k/y
goto :progressbar

:converting
for /R D:\Archive_Pictures\ %%G IN (*.bmp) do (
   call converter_script.bat -source "%%G" -target "%%G%~n1.jpg" -max-height 1024 -max-width 768 -keep-ratio yes -force yes
)
for /R D:\Archive_Pictures\ %%G IN (*.bmp, *.indata) do (
   del %%G /F /q
)
echo.
echo.
echo BACKUP AND CONVERTING HAS COMPLETED SUCCESSFULLY..
echo.
echo.
echo Press [ANY KEY] to EXIT.
pause >nul
exit /b

:progressbar
set Counter=0
set Schalter=2
set Width=0

:1
title [ FINALIZING - BACKUP ]
set /a Counter=%Counter% + 1
set /a Display=%Counter% / 2
FOR /L %%A IN (1,1,%Display%) DO (
   set Display=!Display!²
)
cls
echo            Backing Up Files and Folders...                  %Counter%%%
echo Please Wait Converting in Progress!!
ping localhost -n 1 >nul
if "%Counter%" == "100" goto :converting
goto :1


