# Renderiza capturas PNG de salidas reales ya guardadas en archivos .txt.
# Requiere Microsoft Edge. No inventa datos ni modifica las trazas.
$ErrorActionPreference = 'Stop'
$edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
if (-not (Test-Path $edge)) {
    $edge = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
}
if (-not (Test-Path $edge)) { throw 'No se encontró Edge ni Chrome.' }

$entradas = @(
    @{ Nombre='01_contenedores'; Titulo='Cinco contenedores'; Comando='docker compose ps' },
    @{ Nombre='02_mysql'; Titulo='MySQL y tablas'; Comando='SELECT VERSION(); SHOW TABLES; SELECT COUNT(*) FROM transacciones;' },
    @{ Nombre='03_redis'; Titulo='Redis disponible'; Comando='docker compose exec redis redis-cli ping' },
    @{ Nombre='04_productor'; Titulo='Logs del productor'; Comando='docker compose logs --tail 15 productor' },
    @{ Nombre='05_consumidor1'; Titulo='Logs del consumidor 1'; Comando='docker compose logs --tail 15 consumidor1' },
    @{ Nombre='06_consumidor2'; Titulo='Logs del consumidor 2'; Comando='docker compose logs --tail 15 consumidor2' },
    @{ Nombre='07_pendientes'; Titulo='Consulta de pendientes'; Comando="SELECT * FROM transacciones WHERE estado='PENDIENTE';" },
    @{ Nombre='08_procesadas'; Titulo='Consulta de procesadas'; Comando="SELECT * FROM transacciones WHERE estado='PROCESADO';" },
    @{ Nombre='09_semaforo'; Titulo='Propietario y TTL del semaforo'; Comando='EXISTS, GET y TTL semaforo:transacciones' },
    @{ Nombre='10_con_semaforo'; Titulo='Escenario con semaforo'; Comando='Logs y consultas SQL reales de la corrida A' },
    @{ Nombre='11_sin_semaforo'; Titulo='Escenario sin semaforo'; Comando='Logs y consultas SQL reales de la corrida B' },
    @{ Nombre='12_comparativo'; Titulo='Comparacion de escenarios'; Comando='Resumen de ambas consultas SQL' }
)

foreach ($entrada in $entradas) {
    $nombre = $entrada.Nombre
    $fuente = Join-Path $PSScriptRoot "$nombre.txt"
    if (-not (Test-Path $fuente)) { throw "Falta $fuente" }
    $titulo = [Net.WebUtility]::HtmlEncode($entrada.Titulo)
    $comando = [Net.WebUtility]::HtmlEncode($entrada.Comando)
    $contenido = [Net.WebUtility]::HtmlEncode((Get-Content -Encoding UTF8 -Raw $fuente))
    $html = @"
<!doctype html><html lang="es"><head><meta charset="utf-8"><style>
body{margin:0;background:#101010;color:#e6e6e6;font:16px/1.45 Consolas,monospace}
.titulo{background:#252525;color:#eeeeee;border-bottom:1px solid #404040;padding:8px 16px;font-size:15px}
.terminal{padding:18px 22px}
.comando{color:#eeeeee;margin-bottom:14px}
pre{font:16px/1.45 Consolas,monospace;white-space:pre-wrap;overflow-wrap:anywhere;margin:0}
.fuente{color:#989898;margin-top:22px;font-size:13px}
</style></head><body><div class="titulo">$titulo</div>
<div class="terminal"><div class="comando">PS&gt; $comando</div><pre>$contenido</pre>
<div class="fuente">Salida guardada en evidencias/$nombre.txt</div></div></body></html>
"@
    $pagina = Join-Path $PSScriptRoot "$nombre.html"
    $png = Join-Path $PSScriptRoot "$nombre.png"
    [IO.File]::WriteAllText($pagina, $html, [Text.UTF8Encoding]::new($false))
    $uri = [Uri]::new($pagina).AbsoluteUri
    $perfil = Join-Path $env:TEMP "so1-evidencia-$nombre"
    $lineas = @(Get-Content -Encoding UTF8 $fuente).Count
    $alto = [Math]::Min(1200, [Math]::Max(350, ($lineas + 7) * 24))
    $tamano = "1600,$alto"
    & $edge --headless --disable-gpu --no-first-run --no-default-browser-check --hide-scrollbars --window-size=$tamano --user-data-dir="$perfil" --screenshot="$png" "$uri" | Out-Null
    if (-not (Test-Path $png)) { throw "No se generó $png" }
    Write-Output "Creada: $png"
}
