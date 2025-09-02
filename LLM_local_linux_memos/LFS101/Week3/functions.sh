#!/bin/bash


#example syntax of a function
function_name (){
  command...
}

#display function 

display(){
  echo "This is a simple function that just displays a string" 
}

showmess (){
  echo My favorite Linux Distrivution is: $1
}
echo ""
showmess Ubuntu
showmess Fedora
showmess openSUSE
showmess GENTOO
showmess Slackware