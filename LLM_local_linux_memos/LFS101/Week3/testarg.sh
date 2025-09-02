#!/bin/bash

#Task-write a script that takes exactly one argument and prints it 
#back to standard output. Make sure the script generates 
#a usage message if is run without giving an argument


#check for argument, print a usage message if not supplied.

if [ $# -eq 0 ] ; then
    echo "Usage: $0 argument"
    exit 1

fi
echo $1
exit 0

