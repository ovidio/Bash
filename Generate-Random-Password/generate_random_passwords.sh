#!/bin/bash

#Ask the user to input the number of passwords they would like
echo "Please enter how many random passwords you would like, followed by [ENTER]: "

#Store the user input as variable
read passwordsRequested

#Counter variable to use with array
loopCounter=0

#Creates empty array to be used later when passwords are generated
PASSWORDARRAY=

#create the filename that will hold the newly generated passwords. Format output (2017-08-22_17-22-09)
filename="$(date +'%Y-%m-%d_%H-%M-%S')"
filename="passwords_generated_on_${filename}.txt"

#while loop to iterate through creating the number of passwords the user requested
while [ $loopCounter -le $passwordsRequested ]
do
	#generates the password and stores it in the array, using the loopCounter variable as the index #
	PASSWORDARRAY[loopCounter]=$(openssl rand -base64 20)
	
	#update the loopCounter varibale so that the loop isn't infinite
	loopCounter=$((loopCounter+1))
done

#print the contents of the array (modified so that every entry is on a new line) into a text file
printf "%s\n" "${PASSWORDARRAY[@]}" > $filename
