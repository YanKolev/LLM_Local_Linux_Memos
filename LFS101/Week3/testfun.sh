#!/bin/bash

# Write a script which:

# Asks the user for a number (1, 2 or 3).
# Calls a function with that number in its name. 
# The function should display a message with its name included.

# Functions (must be defined before use)

func1(){
  echo "This message is from function"
}

func2(){
  echo "This message is from function 2" 

}

func3(){
  echo "This message is from function 3" 

}

#Beginning of the main script

# prompt the user to get their choice

echo "Enter a number from 1 to 3"
read n

#call the chosen function
func$n

