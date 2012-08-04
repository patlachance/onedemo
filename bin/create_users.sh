#!/bin/sh

CONFFILE="templates/users/create_users.conf"

echo "Creating opennebula users and groups:"
cat $CONFFILE | grep -v ^# | while read line; do
    usrname=`echo $line | cut -d: -f1`
    grpname=`echo $line | cut -d: -f2`
    usrpass=`echo $line | cut -d: -f3`
    if ! `onegroup show $grpname > /dev/null`; then
        echo "  -> creating group $grpname"
        onegroup create $grpname > /dev/null
    fi
    if ! `oneuser show $usrname > /dev/null`; then
        echo "  -> creating user $usrname"
        oneuser create $usrname "$usrpass" > /dev/null
        oneuser chgrp $usrname $grpname
    else
        echo "  -> user $usrname already defined"
    fi
done
