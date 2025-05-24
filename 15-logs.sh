#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

Logs_Floder="/var/logs/shell-pratice-logs"
Scripit_name=$(echo $0 | cut -d "." -f1)
Log_file="$Logs_floder/$Scripit_name.log"

mkdir -p /temp/shell-pratice

echo "Scripit Stared Executing at:$(date)" | tee -a Log.file

if [ $USERID -ne 0 ]
then
    echo -e "$RError:: please run this scripit with root access $N" | tee -a Log.file
    exit 1
else
    echo "Your running with root access:" | tee -a Log.file
fi        

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a Log.file
else
    echo -e "Installing $2 is ... $R Failure $N" | tee -a Log.file
    exit 1
fi        
}

dnf list installed mysql &>>$Log_file
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it" | tee -a Log.file
    dnf install mysql -y &>>$Log_file
    VALIDATE $? "mysql"
else
    echo -e "Mysql is installed.... $Y nothing todo $N" | tee -a Log.file
fi  

 dnf list installed nginx &>>$Log_file

if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" | tee -a Log.file
    dnf install nginx -y &>>$Log_file
    VALIDATE $? "nginx"
else
    echo -e "nginx is installed... $Y nothing to do $N" | tee -a Log.file
fi

dnf list installed python3  &>>$Log_file

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it" | tee -a Log.file
    dnf install python3 -y &>>$Log_file
    VALIDATE $? "python3"
else
    echo -e "Python3 is installed.. $Y noyhing to do $N" | tee -a Log.file
fi    

