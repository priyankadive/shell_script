#!/bin/bash
echo "Script to monitor disk space"
echo "YOu need to install SSMTP first to send mail"
cd /scripts/
#copy msg file for sending email.this file contains information about email
cp msg.txt_bk msg.txt
#getting IP of machine
ip=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
#check disk space on machine
var=`df | sed s/%//g|awk '{ if($5 > 80) print "Alert"$0;  else print "Normal:"$0 }'|awk '{print $5}'|sed -ne 2p`
#if disk space is utilized above 80% then it will send mail to admin using SSMTP
if [ $var -gt 80 ];
then 
echo "Disk space is utilized more than 80%"
echo "Server IP :$ip">>msg.txt
echo "`df | sed s/%//g|awk '{ if($5 > 80) print "Alert :"$0;}'`">>msg.txt
/usr/sbin/ssmtp your-mail-id-here < msg.txt
sleep 1s
fi
