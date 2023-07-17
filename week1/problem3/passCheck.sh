#! /bin/zsh

pss=$1
#Check length
len=${#pss}

#Check Uppercase
UC=0
if [[ "$pss" != "${pss:l}" ]]
then
UC=1
fi

#Check Lowercase
LC=0
if [[ "$pss" != "${pss:u}" ]]
then
LC=1
fi

#Check Special Character
SC=0
if [[ "$pss" =~ [^[:alnum:]] ]]
then
SC=1
fi

#Check Numericals
NC=0
if [[ "$pss" =~ [0-9] ]]
then
NC=1
fi

if [[ $len -ge 10 && $(($UC+$LC+$SC)) -eq 3 ]]
then
echo "Strong Password"
elif [[ $len -le 6 ]]
then
echo "Low Strength Password"
elif [[ $(($UC+$LC+$SC)) -eq 0 && $NC -eq 1 ]]
then
echo "Low Strength Password"
elif [[ $(($UC+$LC+$SC+$NC)) -le 2 ]]
then
echo "Medium Strength Password"
else
echo "High Strength Password"
fi


