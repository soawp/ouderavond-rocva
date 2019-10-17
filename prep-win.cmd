powershell Start-Process REG -Verb runAs -Argumentlist 'import win-req\allow-scripts-win.reg'
powershell Start-Process POWERSHELL -Argumentlist 'win-req\install_ext.ps1'