@echo off

rem Navigate to MySQL Server bin folder
cd /d "C:\Program Files\MySQL\MySQL Server 8.0\bin"

rem MySQL server credentials
set mysql_user=root
set mysql_password=pass
set mysql_port=8800


rem Backup file path and name
set backup_path=C:\Users\user\Desktop\folder
set backup_name=my-all-databases

rem Create backup
mysqldump --user=%mysql_user% --password=%mysql_password% --port=%mysql_port% --all-databases --routines --events --result-file="%backup_path%\%backup_name%.sql"
if %ERRORLEVEL% neq 0 (
    echo Backup failed: error during dump creation >> "%backup_path%\mysql_backup_log.txt"
) else (
    echo Backup successful >> "%backup_path%\mysql_backup_log.txt"
)

pause
