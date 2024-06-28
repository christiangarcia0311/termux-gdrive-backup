![Static Badge](https://img.shields.io/badge/termux-v.0.118.0-blue)
![Static Badge](https://img.shields.io/badge/rclone_cloud-green?link=https%3A%2F%2Frclone.org%2F)
![Static Badge](https://img.shields.io/badge/cronie_timed_task-red?link=https%3A%2F%2Fdocs.rockylinux.org%2Fguides%2Fautomation%2Fcronie%2F)

# Termux Gdrive Backup

![logo](/assets/logo.jpg)
An automated android backup system design to synchronize your termux files with google drive. This project contains five primary scripts:

- `backup.sh`: performs the actual backup of fhe file using rclone.
- `auto_backup.sh`: sets up an automated backup schedule using cron jobs.
- `auto_disable.sh`: disables the automated backup by removing cron jobs and startup scripts.
- `setup_gdrive.sh`: configures rclone to work with Google Drive.
-  `install.sh`: Installs necessary packages if they are not already installed.

## Requirements

> Termux App

- download [Termux](https://termux.en.uptodown.com/android/download) here.

> Google Account

- see [Google Drive Setup](https://github.com/christiangarcia0311/termux-gdrive-backup/tree/main/assets) here.

## Installation and Setup

> 1. Install git.

```bash
    pkg install git -y
```

> 2. clone the repository.

```bash
    git clone https://github.com/christiangarcia0311/termux-gdrive-backup
```

> 3. configure project directory.

```bash
    cd termux-gdrive-backup
```

> 4. install required packages.

```bash
    sh install.sh
```

> 5. configure gdrive as a remote.

```bash
    sh setup_gdrive.sh
```

> see [Google Drive Setup](https://github.com/christiangarcia0311/termux-gdrive-backup/tree/main/assets) for guide.

> 6. edit backup script.

open `backup.sh` and replace `<foldername_existed>` with the name of the folder you want to back up in termux.

```sh
    LOCAL_DIRECTORY="/data/data/com.termux/files/home/<foldername_existed>"
```

> 7. run the setup script.

### enable automated backup

the `backup.sh` script will run daily at 6 PM (default), synchronizing the specified termux directory with your google drive.

> automatically trigger backup by running:

```bash
    sh auto_backup.sh
```

you can modify cron job time schedule in script by removing `#` in `auto_backup.sh` file.

> manually trigger a backup by running:

```bash
    sh backup.sh
```

> 8. restart termux and start cron service.

start service by running:

```bash
    sv up cron
```

- check status `sv status cron`
- check list `crontab -l`
- stop service `sv down cron`

### disable automated backup

> to disable the automated backup, run `auto_disable.sh`:

```bash
   sh auto_disable.sh
```

### Logs

> you can see backup logs in:

`/data/data/com.termux/files/home/rclone.log`

### Notes

- ensure you have internet access when the backup is scheduled to run.
- modify the cron job schedule in `auto_backup.sh` if you prefer a different backup time.

### Troubleshooting

- verify `rclone` is correctly configured and can access google drive.
- ensure the paths in the scripts are correct.
- check `rclone.log` for detailed error messages.

## Contributions

Feel free to open issues or submit pull requests for improvements and bug fixes.

## License

![Static Badge](https://img.shields.io/badge/MIT-License-blue)


## Author

![Static Badge](https://img.shields.io/badge/Christian-Garcia-orange?link=https%3A%2F%2Fgithub.com%2Fchristiangarcia0311)