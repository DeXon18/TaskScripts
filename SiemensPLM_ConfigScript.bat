@echo off
chcp 65001 > nul 2>&1
color 0A  

echo --------------------------------------------------
echo Creación de estructura en el Registro de Windows
echo Soporte Análisis y simulación - Oskar
echo --------------------------------------------------
echo Este script creará una estructura en el Registro de
echo Windows para configurar Siemens PLM Software.
echo --------------------------------------------------
echo.

REM Establecer valores
set "RegistroBase=HKCU\SOFTWARE\Siemens_PLM_Software"
REM Establecer valor del servidor de licencias (Solo nombre)
set "NombreServidor=NombreServidor"

REM Asignar puerto por defecto
set "Puerto=29000"

REM Asignar paquetes por defecto separados por  punto y coma ;
REM SCACAD100	Simcenter 3D Academic Bundle
REM ACD11		NX Academic - CAE & CAM
REM ACD10		NX Academic - Core & CAD
set "IDBundle=SCACAD100"

echo.
echo       Creando la estructura en el Registro...
echo.

REM Crear la estructura en el registro
rem Crear la clave base
reg add "%RegistroBase%" /f > nul
rem Crear subclaves y valores
reg add "%RegistroBase%\Common_Licensing" /f > nul
reg add "%RegistroBase%\Common_Licensing" /v "NX_SERVER" /t REG_SZ /d "%Puerto%@%NombreServidor%" /f > nul
reg add "%RegistroBase%\Common_Licensing" /v "NX_BUNDLES" /t REG_SZ /d "%IDBundle%" /f > nul
reg add "%RegistroBase%\LicensingTool" /f > nul
reg add "%RegistroBase%\LicensingTool\MainWindow" /f > nul
reg add "%RegistroBase%\LicensingTool\MainWindow" /v "pos" /t REG_SZ /d "@Point(341 173)" /f > nul

REM Comprobar errores en la creación de la estructura
if errorlevel 1 (
    echo Error: No se pudo crear la estructura en el Registro.
) else (
    echo.
    echo       La estructura en el Registro ha sido creada con éxito.
)

REM Agregar configuración adicional de StarCCM+
reg add "HKCU\SOFTWARE\FLEXlm License Manager" /v "CDLMD_LICENSE_FILE" /t REG_SZ /d "%Puerto%@%NombreServidor%" /f > nul

REM Comprobar errores en la configuración adicional
if errorlevel 1 (
    echo       Error: No se pudo agregar la configuración adicional en el Registro.
)

echo.
echo.
echo.
echo.
pause
