@echo off
set "MKVToolNix=C:\Program Files\MKVToolNix\mkvpropedit.exe"

REM Verificar si mkvpropedit.exe existe en la ubicación especificada
if not exist "%MKVToolNix%" (
    echo El archivo mkvpropedit.exe no se encontró en la ubicación especificada.
    echo Descargue MKVToolNix desde el siguiente enlace:
    echo https://mkvtoolnix.download/downloads.html
    exit /b
)

REM Busca recursivamente todos los archivos con extensión .mkv en el directorio actual y subdirectorios
for /r %%i in (*.mkv) do (
    REM Imprime un mensaje indicando el archivo que se está procesando actualmente
    echo Processing "%%i"
    REM Ejecuta el comando mkvpropedit.exe de la herramienta MKVToolNix para eliminar el título del archivo
    "%MKVToolNix%" "%%i" -d title
)
