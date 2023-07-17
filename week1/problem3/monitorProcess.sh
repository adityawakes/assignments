#! /bin/zsh
# Starts the process
zsh $1 &
# Storing the process id
myPID=$!
while true
do
# Randomly killing the process for testing code
if [[ $(($RANDOM%1000)) -eq 0 ]]
then
echo "Killed process"
kill -9 $myPID
fi
# Checking if the process is still running
flag=$(ps axo pid | grep $myPID | wc -w)
if [[ flag -eq 0 ]]
then
# If the process is stopped, restarting it.
echo "Process Stopped.Restarting..."
sleep 1
zsh $1 &
myPID=$!
fi
done


