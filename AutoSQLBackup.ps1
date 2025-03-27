# SqlDatabaseBackup
# This repository houses a PowerShell script designed to automate the backup process for the SQL database. 
# Regular backups are crucial for data integrity and disaster recovery. 
# Feel free to explore, contribute, and ensure your database is always backed up for peace of mind.
# 
# You can add a touch to the script by creating a task scheduler for it to run daily, weekly, or monthly.
#
# Check out my video on task scheduler:
# [Watch the Video Here](https://www.youtube.com/watch?v=U9zvr_GYC-U)

# Set the current date and time
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

# Specify the database name
$databaseName = "your_database_name"

# Specify the backup path
$backupPath = "C:\specify_the_path_here"

# Build the backup file name without emojis
$backupFileName = "$backupPath\$databaseName" + "_Backup_$timestamp.bak"

# SQL Server connection information
$serverInstance = "TESLAB\OPTIMUSQLEXPR"
$databaseCredential = ""

# SQL Server backup command
$backupCommand = "BACKUP DATABASE [$databaseName] TO DISK='$backupFileName'"

# Execute the backup command
Invoke-Sqlcmd -ServerInstance $serverInstance -Database $databaseName -Query $backupCommand
