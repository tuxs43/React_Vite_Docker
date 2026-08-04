param(
    [string]$ImageName = "react-vite-docker",
    [int]$Port = 5173
)

$ErrorActionPreference = "Stop"

Write-Host "[1/6] Verificando archivos requeridos..."
if (!(Test-Path "./Dockerfile")) {
    throw "Falta Dockerfile en la raiz del proyecto."
}
if (!(Test-Path "./package.json")) {
    throw "Falta package.json en la raiz del proyecto."
}

Write-Host "[2/6] Verificando Docker instalado..."
$null = Get-Command docker -ErrorAction Stop

docker version | Out-Null

Write-Host "[3/6] Construyendo imagen Docker..."
docker build -t $ImageName .

Write-Host "[4/6] Iniciando contenedor de prueba..."
$containerId = docker run -d -p "${Port}:5173" $ImageName
if ([string]::IsNullOrWhiteSpace($containerId)) {
    throw "No se pudo iniciar el contenedor."
}

try {
    Write-Host "[5/6] Esperando inicio de Vite..."
    Start-Sleep -Seconds 6

    Write-Host "[6/6] Probando respuesta HTTP local..."
    $response = Invoke-WebRequest -Uri "http://localhost:$Port" -UseBasicParsing -TimeoutSec 15
    if ($response.StatusCode -ne 200) {
        throw "La aplicacion no respondio con HTTP 200."
    }

    Write-Host "Validacion OK: app en Docker responde correctamente."
}
finally {
    Write-Host "Deteniendo contenedor de prueba..."
    docker stop $containerId | Out-Null
}
