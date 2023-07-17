#! /bin/zsh
# Starts the process
zsh $1 &
# Storing the process id
myPID=$!
timeStamp=$(ps axo pid,lstart | grep $myPID | awk '{print $2 $3 $4 $5 $6}')
while true
do
# Checking if the process is still running
flag=$(ps axo pid | grep $myPID | wc -w)
curTime=$(ps axo pid,lstart | grep $myPID | awk '{print $2 $3 $4 $5 $6}')
if [[ $flag -eq 0 || "$timeStamp" != "$curTime" ]]
then
# If the process is stopped, restarting it.
echo "Process Stopped.Restarting..."
sleep 1
zsh $1 &
myPID=$!
timeStamp=$(ps axo pid,lstart | grep $myPID | awk '{print $2 $3 $4 $5 $6}')
fi
done


