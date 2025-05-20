#!/bin/bash

# USERID=$(id -u)

# if [ $USERID -ne 0 ]
# then
#     echo "ERROR:: Please run this script with root access"
#     exit 1 #give other than 0 upto 127
# else
#     echo "You are running with root access"
# fi

# dnf list installed mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: please run this scripit with root access"
    exit 1
else
    echo "Your running with root access:"
fi   

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "Installing MySQL is ... SUCCESS"
else
    echo "Installing MYSQL is ... Failure"
   exit 1
fi
else
    echo "MySQL is already installed...Nothing to do"
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing MySQL is ... SUCCESS"
# else
#     echo "Installing MYSQL is ... Failure"
#     exit 1
# fi           
