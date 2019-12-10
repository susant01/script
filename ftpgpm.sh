HOST=XXXXXXXX
USER=XXXXXXXX
PASS=XXXXXXXX
LOCATION=XXXX
curl ftp://$HOST$LOCATION --user "$USER:$PASS" >> /var/log/gpm/ftp.txt #to get list of all file in ftp remote server
H=`date +%H`
cat ~/ftp.txt | grep "Dec `date +%m` `expr $H - 1 `" | tee ~/final_ftp.txt
cut -c 56- ~/final_ftp.txt | tee ~/final_final.txt 
for i in ~/final_final.txt
do
ftp -n $HOST < EOF
user $USER:$PASS
prompt noprompt
lcd 
cd $LOCATION
get $i
bye
EOF
done



