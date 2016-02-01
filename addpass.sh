#!/bin/bash
# Assign file descriptors to users and passwords files
exec 1< users.txt
exec 2< pass.txt
# Read user and password
while read iuser <&1 && read ipasswd <&2 ; do
    # Just print this for debugging
    echo "\tCreating user with password: %s\n" $iuser $ipasswd
    # Create the user with adduser (you can use another command to add user)
    useradd $iuser
    mkdir -p /home/$iuser #if user directory is not created by default
    # Assign the password to the user, passwd must read it from stdin
   # echo $ipasswd | passwd --stdin $iuser
echo $iuser:$ipasswd | chpasswd
done
