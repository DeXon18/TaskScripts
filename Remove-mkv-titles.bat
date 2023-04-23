@echo off
REM Busca recursivamente todos los archivos con extensión .mkv en el directorio actual y subdirectorios
for /r %%i in (*.mkv) do (
    REM Imprime un mensaje indicando el archivo que se está procesando actualmente
    echo processing "%%i"
    REM Ejecuta el comando mkvpropedit.exe de la herramienta MKVToolNix para eliminar el título del archivo
    "C:\Program Files\MKVToolNix\mkvpropedit.exe" "%%i" -d title
)
