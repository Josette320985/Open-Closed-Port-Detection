param(
    [Parameter(Mandatory=$true)]
    [int]$Port,
    
    [string]$ComputerName = "localhost"
)

$result = Test-NetConnection -ComputerName $ComputerName -Port $Port -WarningAction SilentlyContinue

if ($result.TcpTestSucceeded) {
    Write-Host "El puerto $Port en $ComputerName esta ABIERTO" -ForegroundColor Green
} else {
    Write-Host "El puerto $Port en $ComputerName esta CERRADO" -ForegroundColor Red
}
