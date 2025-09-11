### Paste exact workflow commands, step-by-step

# Make a dropbox directory for client data, then stop it from syncing:

mkdir ~/data/fastq/
dropbox exclude add ~/data/fastq/

sudo apt update
sudo apt install rclone -y

## On Linux CLI (ie laptop):

rclone authorize "dropbox"

# Follow website link -- copy and paste token

## On CLoudCIX VM:

rclone config

# Need to do the following selections:

# n
# dropbox
# 9
# Enter
# Enter
# n
# n  <-- We are NOT using auto config on headless VM
# paste in the dropbox token
# y
# q

## Test on CLoudCIX VM:

rclone ls dropbox: | head

rclone copy dropbox:dropbox/path/to/fastq/ ~/CloudCIX/path/for/fastq/ --progress --transfers=4 --checkers=8

# perform "md5sum -c *txt > output.txt"

## FTP in folder with fastq files

# Log into NCBI and move to FTP submission page for details as these change

sudo apt install lftp -y

# FTP is slow and clunky, but more stable than ascp

lftp -u subftp,'PASSWORD' ftp-private.ncbi.nlm.nih.gov
cd uploads/xxxxxx_xxxxxxx

mkdir <project_upload_dir>
cd project_upload_dir

mput /dropbox/path/with/fastq/*.gz

## Monitor on Filezilla GUI:

Protocol: FTP - File Transfer Protocol
Encryption: Use plain FTP (instead of Require explicit FTP over TLS)
Host: ftp-private.ncbi.nlm.nih.gov
Port: 21
User: subftp
Password: PASSWORD
Connec

Then cd uploads/#####_#####


