import os
import datetime

# MySQL connection details
db_user = "your_mysql_username"
db_password = "your_mysql_password"
db_name = "your_mysql_database_name"

# Backup directory path
backup_dir = "/path/to/backup/directory"

# Get current date and time
now = datetime.datetime.now()
date_time = now.strftime("%Y-%m-%d_%H-%M-%S")

# Backup filename
backup_file = os.path.join(backup_dir, f"{db_name}_{date_time}.sql")

# Run mysqldump command to backup database
os.system(f"mysqldump -u {db_user} -p'{db_password}' {db_name} > {backup_file}")

print("MySQL backup complete!")
