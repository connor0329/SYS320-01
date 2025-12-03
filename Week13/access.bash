echo "File was accessed $(date)" >> /home/champuser/SYS320-01/Week13/fileaccesslog.txt

echo "To: connor.mccracken@mymail.champlain.edu" > /home/champuser/SYS320-01/Week13/emailform.txt
echo "Subject: File Accessed" >> /home/champuser/SYS320-01/Week13/emailform.txt
echo "" >> /home/champuser/SYS320-01/Week13/emailform.txt
cat /home/champuser/SYS320-01/Week13/fileaccesslog.txt >> /home/champuser/SYS320-01/Week13/emailform.txt
cat /home/champuser/SYS320-01/Week13/emailform.txt | ssmtp connor.mccracken@mymail.champlain.edu
