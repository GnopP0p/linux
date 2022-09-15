#! /bin/bash

#variables
read -p "Direktorija: " dir
read -p "Useris: " usr
read -p "User pass: " usrpass
read -p "Group: " group

#logika
mkdir -p $dir
useradd -m -d $dir -p $usrpass $usr
if [ $(getent group $group) ]; 
then
	usermod -a -G $group $usr
else
	groupadd $group
	usermod -a -G $group $usr
fi

