@echo off
REM Este script se utiliza para crear reglas de firewall que bloquean todas las conexiones para archivos con un nombre dado.
REM Copialo en el directorio del programa que quieras bloquear y ejecutalo desde linea de comandos.

cls
REM Verifica si se proporcionó un nombre de regla como argumento.
If "%1"=="" GOTO :norulename
SET RULENAME=%1

REM Solicita al usuario confirmar la acción.
ECHO Zentinels: ¿Quieres bloquear todas las conexiones en el firewall para los archivos *.exe con el nombre "%RULENAME%"?
ECHO.
ECHO.
pause
Echo.

REM Recorre todos los archivos *.exe y crea reglas de firewall de entrada y salida para cada archivo.
FOR /r %%G in ("*.exe") Do (
    @echo %%G
    NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes"
)
FOR /r %%G in ("*.exe") Do (
    @echo %%G
    NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes"
)

Echo.
Echo Listo.
Echo.
GOTO :Finish

:norulename
Echo ¡Error! - No has especificado un nombre para la regla - firewall-blocking-script "Nombre de la regla"
Echo.

:Finish
Echo Bloqueo del firewall finalizado...
pause
