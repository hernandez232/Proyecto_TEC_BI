for /F "tokens=2 delims==." %%I in ('%SystemRoot%\System32\wbem\wmic.exe OS GET LocalDateTime /VALUE') do set "LocalDateTime=%%I"
set "LocalDate=%LocalDateTime:~0,8%"
set "LocalTime=%LocalDateTime:~8,4%"
if not exist "D:\RegistrosLogs\%LocalDate%" mkdir "C:\RegistrosLogs\%LocalDate%"


cd "C:\data-integration"
call Kitchen.bat /file:"C:\REPOSITORIO\PROYECTO_PENTAHO\Jobs\JB Main.kjb" -param:"SISTEMA=PROYECTO_PENTAHO" -logfile=C:\RegistrosLogs\%LocalDate%\log_proyecto_pentaho_%LocalTime%.log

exit