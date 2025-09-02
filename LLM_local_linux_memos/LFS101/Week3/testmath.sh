#!/bin/bash

#Task
#Write a script that will act as a simple calculator for add, subtract, multiply and divide.

#Each operation should have its own function.
#Any of the three methods for bash arithmetic, ($((..)), let, or expr) may be used.
#The user should give 3 arguments when executing the script:
#- The first should be one of the letters a, s, m, or d to specify which math operation.
#- The second and third arguments should be the numbers that are being operated on.
# The script should detect for bad or missing input values and display the results when done.


#Functions. must be before the main part of the script

#in each method 1 uses $((..))
# method 2 uses let 
# method 3 uses expr

add (){
  answer1=$(($1 + $2))
  let answer2=( $1 + $2)
  answer3=`expr $1 + $2`
}

sub(){
  answer1=$(($1 - $2))
  let answer2=($1 -$2)
  answer3=`expr $1 - $2`
}

mult() {
  answer1=$(($1 * $2))
  let answer2=($1 * $2)
  answer3=`expr $1 \* $2`
}

div(){
  answer1=$(($1 / $2))
  let answer2=($1 / $2)
  answer3=`expr $1 / $2`
}
#nd of functions

#main part of the script

#need 3 arguments, and parse to make sure they are valid types
op=$1 ; arg1=$2 ; arg2=$3

[[ $# -lt 3 ]] && \ echo "Usage: Provide an operation (a,s,m,d) and two numbers" && exit 1 
[[ $op != a ]]  && [[ $op != s ]] && [[ $op != d ]] && [[ $op != m ]] && \

echo operator must be a, s, m, or d, not $op as supplied

#ok, do the work! 

if [[ $op == a ]] ; then add $arg1 $arg2
elif [[ $op == s ]] ; then sub $arg1 $arg2
elif [[ $op == m ]] ; then mult $arg1 $arg2
elif [[ $op == d ]] ; then div $arg1 $arg2
else 
echo $op is not a, s, m, or d, aborting ; exit 2 
fi

# show the answers

echo $arg1 $op $arg2 :
echo 'Method 1, $((..)),' Answer is $answer1
echo 'Method 2, let,' Answer is $answer2
echo 'Method 3, expr,' Answer is $answer3

