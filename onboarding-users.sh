#/bin/bash
FILE="names.csv"
home="/home"
     if  [ -e "$FILE" ]
         then
         echo "Users CSV file does exist"
    while read -r line  
      do  
    
    if [ $line -e {$home} ]
    then
     echo "user $line Already exist on this server"
     else
   sudo useradd -m $line
   sudo usermod -G developers $line
   sudo mkdir /home/$line/.ssh
   sudo touch /home/$line/.ssh/authorized_keys 
   sudo cp /home/banjo/.ssh/id_rsa.pub >> /home/$line/.ssh/authorized_keys
   fi
 done < $FILE
    else
    echo "TERMINATED! file $FILE does not Exist! in this script!"
 fi