#This script is tested on Ubuntu 14.04
#Pre-requisites: rsync,both machines shoud be able to ssh each other    
#!/bin/bash
old_IFS=$IFS      # save the field separator           
IFS=$'\n'     # new field separator, the end of line           
echo "Rsync for Directory on remote server "
cd /script #script directoy which contain this (rsync.sh) script 
/usr/bin/rsync -e 'ssh -p 22' -avzp remoteuser@<IP>:/path/to/remote/directory /path/to/local/directoy
IFS=$old_IFS     # restore default field separator
