#!/bin/bash

#Set the thresold count limit

threshold_count=100

count=$(egrep -e 'HTTP/1.1" 4|HTTP/1.1" 5' /Users/aramu1/myprojects/log-monitoring/apache_logs | wc -l)

if [ "$count" -gt "$threshold_count" ] ; then

# Send a mail to given email id when errors found in log

SUBJECT="Error Code Count is : $count"

# This is a temp file, which is created to store the email message.

MESSAGE="/tmp/logs.txt"

TO="demouser163@gmail.com"

echo "ATTENTION: Errors are found in /Users/aramu1/myprojects/log-monitoring/apache_logs. Please Check with Linux admin." >> $MESSAGE

echo  "Hostname: `hostname`" >> $MESSAGE

echo -e "\n" >> $MESSAGE

echo "+------------------------------------------------------------------------------------+" >> $MESSAGE

echo "Error messages in the log file as below" >> $MESSAGE

echo "+------------------------------------------------------------------------------------+" >> $MESSAGE

egrep -e 'HTTP/1.1" 4|HTTP/1.1" 5' /Users/aramu1/myprojects/log-monitoring/apache_logs >>  $MESSAGE

mail -s "$SUBJECT" "$TO" < $MESSAGE

#rm $MESSAGE

fi
