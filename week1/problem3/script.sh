#! /bin/zsh

echo "Hey there! Please enter the credentials."
echo "Enter Username-"
read UserName
echo "Enter Password-"
read -s  usrPassword
./passCheck.sh $usrPassword

