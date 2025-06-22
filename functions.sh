ID=$(id -u)
VALIDATE(){
    if ($? -ne 0)
    then  
       echo "ERROR:: installing fail"
       exit 1
    else
       echo"intalling success"
    fi
}
   if ($ID -ne 0)
   then 
      echo "ERROR:: please run the script with root access"
      exit 1
   else
    echo " you are root user"
   fi

   apt install mysql -y
   VALIDATE$? "Installing mysql"

   apt install git -y
   VALIDATE$? "Installing git"
  