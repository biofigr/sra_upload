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

sudo apt install lftp -y




