# Paste exact workflow commands, step-by-step

sudo apt update
sudo apt install rclone -y

## On Linux CLI (laptop):

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


