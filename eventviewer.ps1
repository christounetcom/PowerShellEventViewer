param([string]$ComputerName = 'localhost', [datetime]$StartTimestamp, [datetime]$EndTimeStamp)

$Logs = (Get-WinEvent -ListLog * -ComputerName $ComputerName | Where-Object {$_.RecordCount }).LogName

$FilterTable = @{
    'StartTime' = $StartTimestamp
    'EndTime' = $EndTimeStamp
    'LogName' = $Logs
}

Get-WinEvent -ComputerName $ComputerName -FilterHashtable $FilterTable -ErrorAction 'SilentyContinue'