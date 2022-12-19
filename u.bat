@echo off
echo ny4rlk0_
:: batch code to request admin previleges, if no admin previleges
net session >nul 2>&1
if NOT %errorLevel% == 0 (
powershell -executionpolicy bypass start -verb runas '%0' am_admin & exit /b
)

:: Going back to script directory
cd %~dp0
:: Download reg file
PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ny4rlk0/LCD-show/master/u.reg', 'u.reg')"
:: Execute System Power Policy Unlock
regedit.exe /S u.reg
:: Deleting the bat and file
del /f u.reg
del /f u.bat > nul 2>&1
