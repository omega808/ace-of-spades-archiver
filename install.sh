#!/bin/bash
#install script to set userdefined path


echo "Would you like to add program to crontab to avoid running program manually daily[Y/n]?" REPLY

if [[ $REPLY =~ [y-Y] ]];
then
	read -p "Please enter full path where the program will be run" REPLY
	sudo sed -i ' 18i\ @daily root bash $REPLY\/ace-of-spades ' /etc/crontab
fi


#Counter for loop
X=1


while [ $X -eq 1 ];
do

	#Ask user for path
	read -p "Enter full path to folder where files will be archived:" ARCHIVE

	#Make sure the user used absolute path
	if [[ ! $ARCHIVE =~ /$ || ! $ARCHIVE =~ ^/ ]];
	then 
		echo "Make sure to enter the full path"
		
	else
		let X++
	fi

#Write to variable in primary shellscript
sed -i " 8c\ARCHIVE_PATH=\"$ARCHIVE\" " ace-of-spades

#Make primary script executable
sudo chmod 755 ace-of-spades

#Delete install script, to give the facade that some installation took place
sudo rm -r install.sh

exit 0
