#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

if [ $USERID -ne 0 ]
then
    echo -e "$RError:: please run this scripit with root access $N"
    exit 1
else
    echo "Your running with root access:"
fi        

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ... $G SUCCESS $N"
else
    echo -e "Installing $2 is ... $R Failure $N"
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
    echo -e "Mysql is installed.... $Y nothing todo $N"
fi  

 dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx is installed... $Y nothing to do $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Python3 is installed.. $Y noyhing to do $N"
fi    
