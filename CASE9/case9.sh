#!/bin/bash 

# CONFIGURATION

Hostfile="hosts.txt"
Bin_ping="/bin/ping"
Bin_wget="/usr/bin/wget"

# FUNCTIONS

proc_checkping() {

    # ping the host 1 time with a timeout of 2 seconds.
    $Bin_ping -c 1 -W 2 $HostIP &> /dev/null 

    # check the exit code from ping, if it equals to zero we know it worked..
    if [ $? -eq 0 ]; then

        # go check the webserver if we defined one
        if [ -n $Hostwww ]; then
            proc_checkwww
        else
            # just skip checking the webserver, ping looked fine aswell ! just print it out.
            echo "$Hostname     $HostIP         UP          SKIP"
        fi

    else
        # host seems down :(
        echo "$Hostname         $HostIP         DOWN        UNKNOWN"
    fi
}

proc_checkwww() {

    # try to grab the file from the webserver
    $Bin_wget --spider http://$HostIP/$Hostwww &> /dev/null

    if [ $? -eq 0  ]; then # check return value from wget
        echo "$Hostname      $HostIP         UP          UP"
    else
        echo "$Hostname      $HostIP         UP          DOWN"
    fi
}

# just a function to print the line, cba to write it more then once ;)
proc_printline() {
    echo "---------------------------------------------------"
}

# MAIN PROGRAM

while true
do
    # clear the console
    clear

    # echo out some standard text :)
    echo "HOSTNAME          IP          UP/DN           WWW"
    proc_printline

    while read host # loop through the hostfile line by line!
    do
        # Grab all the information for the current line
        Hostname=`echo $host | awk '{ print $1 }'`
        HostIP=`echo $host | awk '{ print $2 }'`
        Hostwww=`echo $host | awk '{ print $3 }'`

        proc_checkping
        proc_printline

    done <$Hostfile # throw in the hostfile into the loop..
    sleep 5
done
