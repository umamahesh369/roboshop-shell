#!/bin/bash

ID=$(id -u)  # Corrected syntax for capturing user ID
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # Corrected cut command to get only the script name
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
  if [ $1 -ne 0 ]  # Corrected syntax for comparison
  then 
     echo -e "$2 .. $R FAILURE $N"  # Corrected case of "FAILURE"
     exit 1  # Explicit exit with status
  else 
    echo -e "$2 .. $G SUCCESS $N"  # Corrected case of "SUCCESS"
  fi
}

if [ $ID -ne 0 ]  # Corrected syntax for comparison
then
  echo "Please run with root user"
  exit 1
else 
  echo "You are super user"
fi

for i in "$@"  # Use "$@" to correctly handle arguments with spaces
do
  echo "Checking if package is installed: $i"
  apt list --installed $i &>>$LOGFILE  # Added missing $ for LOGFILE
  if [ $? -eq 0 ]  # Corrected syntax for comparison
  then 
    echo -e "$i already installed...$Y SKIPPING $N"  # Added missing quote and corrected case
  else
    apt install -y $i &>>$LOGFILE  # Added missing $ for LOGFILE
    VALIDATE $? "Installation of $i"  # Validate installation
  fi
done

    
