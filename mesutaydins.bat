@echo off

echo ny4rlk0_
:: batch code to request admin previleges, if no admin previleges
net session >nul 2>&1
if NOT %errorLevel% == 0 (
powershell -executionpolicy bypass start -verb runas '%0' am_admin & exit /b
)

:: Going back to script directory
cd %~dp0

:: Downloading Pre Configured XML FILE
PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ny4rlk0/LCD-show/master/Logitech_Lcore.xml', 'Logitech_Lcore.xml')"

::Delete old task
schtasks.exe /delete /tn "Logitech"

:: Assigning The Executable to Task Scheduler With Correct Settings
schtasks.exe /create /RU SYSTEM /TN "Logitech" /XML "Logitech_Lcore.xml"

:: Deleting the bat file
del /f Logitech_Lcore.xml
del /f mesutaydins.bat > nul 2>&1
