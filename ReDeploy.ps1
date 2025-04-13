param(
    [Parameter()]
    [String]$server,

    [Parameter(Mandatory=$true)]
    [string]$service
)

# 1 - Stop the service
Write-Host "Stopping Service..."
(get-service -ComputerName "$server" -Name "$service").Stop()
Write-Host "Stopped!"

# 2 - Copy the new version
Write-Host "Copying the new version"
Copy-Item -Path \code\offVB\ewms-g3\base\java\EWMSApp\EWMSassembly\target\EWMS.ear -Destination "\\$server\c$\jbosseap-jboss8\standalone\deployments\EWMS.ear"
Write-Host "COMPLETE"

# 3 - Restart the service once your new bundle has been copied
Write-Host "Starting Service..."
(get-service -ComputerName "$server" -Name "$service").Start()
Write-Host "Started!"

# 4 - Observe all looks good by tailing the logs 
Write-Output "Tailing logs from server $server"

Invoke-Command -ComputerName "$server" -ArgumentList $server -ScriptBlock {
    param($p1)
    Get-Content -Path "C:\EWMSGWS\logs\UniverisAPS-G3W-$p1.log" -Wait -Tail 10
}