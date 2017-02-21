#!/bin/bash
#user and shell checker script, name it checker.sh

user=$1
shell=$2
for x in $(cat /etc/passwd)
do
if [ $# -ne 2 ]; then
        echo "Usage: $0 username shell"
        exit 2
fi
        un=$(echo $x | grep $user)
        if [ $? -ne 0 ]; then
                echo “$user not yet found”
        else
                echo “$user found”
                sh=$(echo $x| cut -d':' -f7 | cut -d'/' -f3)
                if [ “$sh” = “$shell” ]; then
                        echo “shell is correct”
                else “shell is incorrect”
                fi
        fi
done
