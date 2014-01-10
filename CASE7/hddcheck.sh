#!/bin/bash 

Max_percent=10
Bin_df="/bin/df" # path to the df binary
Hdd_config="disks.conf" # path to the config file for the disks.

for Disk in `cat $Hdd_config`; do # loop through all the hdds in the config file
    Freespace=`$Bin_df $Disk | awk '{ print $5 }' | egrep -o '[0-9]{1,3}'` # run 'df' on the current disk in the loop from the config then grab the 5'th element and just grab numbers (1 to 3 times), since we cant have more then 3 numbers ( 100 ).

    if [ $Freespace -ge $Max_percent ]; then # check if the percentage is the same as the max percent or above.
        echo "WARNING, only $Freespace% space left on $Disk"
        echo "WARNING, only $Freespace% left on $Disk" | mail -s "Low on space on $Disk" root # send warning main to the root account  
    else
        # disk seems fine atm :)
        echo "$Disk is OK... with $Freespace% left"
    fi
done
