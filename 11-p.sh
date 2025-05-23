#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1
else 
    echo "Your runnning with root access"
fi

dnf list installed mysql

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

# if [ $? -eq 0 ]
# then
#     echo "Installing MySQL is ... SUCCESS"
# else
#     echo "Installing MYSQL is ... Failure"
#     exit 1
# fi    


