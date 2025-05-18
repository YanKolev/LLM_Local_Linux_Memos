#!/bin/bash

#Task
#Write a script which:

#Asks the user for a number, which should be "1" or "2". 
#Any other input should lead to an error report.
#Sets an environmental variable to be "Yes" if it is "1", and "No" if it is "2".
#Exports the environmental variable and displays it.

echo "Enter 1 or 2, to set the anvironmental variable EVAR to Yes or No"
read ans

#set up a return code
RC=0

if [ $ans -eq 1 ]
  then
      export EVAR="Yes"
else
  if [ $ans -eq 2 ]
  then
      export EVAR="No"
  else

#can only reach here with a bad answer

export EVAR="Unknown"
RC=1

fi

fi
echo "The value of EVAR is $EVAR"
exit $RC