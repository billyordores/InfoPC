@echo off

@echo Nombre del equipo: %COMPUTERNAME%

::procesador
PowerShell.exe -Command "Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*""

::memoria fisica total
systeminfo > Cargando...txt
find /i "total" Cargando...txt
del Cargando...txt

::memoria disponible
systeminfo > Cargando....txt
find /i "disponible" Cargando....txt > Cargando.....txt
del Cargando....txt
find /v "virtual" Cargando.....txt
del Cargando.....txt

::disco duro libre y total
PowerShell.exe -Command "get-psdrive -psprovider filesystem"

::características de disco duro 
wmic diskdrive get caption,serialnumber

::Habilitado la virtualización
PowerShell.exe -Command "Get-CimInstance win32_processor | fl *" > Cargando......txt
find /i "VirtualizationFirmwareEnabled" Cargando......txt
del Cargando......txt