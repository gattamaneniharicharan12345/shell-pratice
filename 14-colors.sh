#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: please run this scripit with root access"
    exit 1
else
    echo "Your running with root access:"
fi        

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "Installing $2 is ... SUCCESS"
else
    echo "Installing $2 is ... Failure"
    exit 1
fi        
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "Mysql is installed.... nothing todo"
fi  

 dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is installed... nothing to do"
fi

dng list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "Python3 is installed.. noyhing to do"
fi    
