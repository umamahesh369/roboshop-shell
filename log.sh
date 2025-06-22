#!/bin/bash

ID=($id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.LOG"

apt install mysql -y &>> $LOGFILE
apt install git -y &>> $LOGFILE