#!/bin/bash

# My Favorite States
my_states = ('Texas' 'Texas2' 'Texas3' 'Texas4' 'Texas5')
nums=$(echo {0..9})
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2>/dev/null)

#Create for Loops
# If statement below
for state in ${state[@]}
do

	if [Texas]	
	then 
		echo "You're Awesome"
	else
		echo "You're An Idiot"
	fi
done

for num in ${nums[@]}
do 
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
		echo $num
	fi
done

#Print each item in variable list
for x in ${ls_out[@]}
do
	echo $x
done

#Create a for loop to print out execs on one line for each entry
for exec in ${execs[@]}
do
	echo $exec
done
