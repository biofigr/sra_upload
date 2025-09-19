# sra_upload
Document the FASTQ upload process of Dropbox to CloudCIX to SRA.

# Commands to upload fastq files from Dropbox to CloudCIX VM, then to NCBI SRA via FTP

- Using Dropbox for client related data as it is OS-independent and easy to use
- Using rclone to sync data from Dropbox to CloudCIX VM
- Using FTP to upload data to NCBI SRA as ascp is unreliable on Cloud

- If necessary, install:

sudo apt update
sudo apt install rclone -y
sudo apt install lftp -y

### Step-by-step guide, copy and paste workflow and commands:

## Step 1: Set up Dropbox folder on locally or online

- Make a dropbox directory for client data
- Stop directory from syncing to laptop

mkdir ~/Dropbox/project/data/fastq/
dropbox exclude add ~/Dropbox/project/data/fastq/

## Step 2: Install rclone and configure Dropbox remote

- On local machine (not CloudCIX VM):
rclone authorize "dropbox"

- Follow website link -- copy and paste token

### On CLoudCIX VM:

rclone config

- Need to do the following selections:

- n
- dropbox
- 9 # for Dropbox
- Enter
- Enter
- n
- n  # We are NOT using auto config on headless VM
- paste # in the dropbox token
- y
- q

### Test on CLoudCIX VM:

rclone ls dropbox: | head
rclone copy dropbox:dropbox/path/to/fastq/ ~/CloudCIX/path/for/fastq/ --progress --transfers=4 --checkers=8

- perform "md5sum -c *txt > output.txt" # to check md5sums if provided

## Step 2 alternative: data provided on HDrive

lsblk -f
sudo mount -t ntfs-3g /dev/sda2 /mnt/ #assuming /mnt/ is already created and empty  
rsync -avh --progress /mnt/external/ user@vm.ip:/remote/path/ # Change to CloudCIX VM IP and path

## Step 3: FTP transfer from folder with fastq files

- Log into NCBI and move to FTP submission page for details as these change



- FTP is slow and clunky, but more stable than ascp

lftp -u subftp,'PASSWORD' ftp-private.ncbi.nlm.nih.gov
cd uploads/xxxxxx_xxxxxxx

mkdir <project_upload_dir>
cd project_upload_dir

mput /dropbox/path/with/fastq/*.gz

-- Monitor on Filezilla GUI:

Protocol: FTP - File Transfer Protocol
Encryption: Use plain FTP (instead of Require explicit FTP over TLS)
Host: ftp-private.ncbi.nlm.nih.gov
Port: 21
User: subftp
Password: PASSWORD
Connec

Then cd uploads/-----_-----
