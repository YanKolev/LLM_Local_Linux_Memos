#!/bin/bash

# Task
# Write a script which:

# Prompts the user for a directory name and then creates it with mkdir.
# Changes to the new directory and prints out where it is using pwd.
# Using touch, creates several empty files and runs ls on them to verify they are empty.
# Puts some content in them using echo and redirection.
# Displays their content using cat.
# Says goodbye to the user and cleans up after itself.

#prompt user for a directory name
echo "Give a directory name to create:"
read NEW_DIR

#save original directory
ORIG_DIR=$(pwd)

#check to make make sure it doesnt already exist
[[ -d $NEW_DIR ]] && echo "$NEW_DIR already exists, aborting" && exit mkdir $NEW_DIR

#change to new directory and prints out where it is using pwd

cd $NEW_DIR
pwd

# using touch, creates several empty files and runs ls on them to verify they are empty

for n in 1 2 3 4
do 
    touch file$n
  done

ls file?

#second approach maybe
# ls file1 file2 file3

#could have just done touch file1 file2 file3 file4, just want to show do loop!

#puts some content in them using echo and redirection

for names in file? 
do  
  echo this file is named $names > $names
  done

#displays their content using cat

cat file? 

# says goodbye to the user and cleans up after itself

cd $ORIG_DIR 
rm -rf $NEW_DIR
echo "Goodbye My friend"