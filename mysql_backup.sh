#!/bin/bash

# MySQL connection details
db_user="your_mysql_username"
db_password="your_mysql_password"
db_name="your_mysql_database_name"

# Backup directory path
backup_dir="/path/to/backup/directory"

# Get current date and time
now=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup filename
backup_file="$backup_dir/$db_name"_"$now.sql"

# Run mysqldump command to backup database
mysqldump -u $db_user -p$db_password $db_name > $backup_file

echo "MySQL backup complete!"
