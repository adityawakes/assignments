#! /bin/zsh
remoteUserName=$(cat remoteCreds.txt | awk '{print $1}')
remoteIP=$(cat remoteCreds.txt | awk '{print $2}')
n=$(cat userList | wc -l)
for i in $(seq 2 $n)
do
userName=$(head "-$i" userList | tail -1| awk '{print $1}')
pub_key_path=$(head "-$i" userList | tail -1| awk '{print $3}')
pub_key=$(head "-$i" userList | tail -1| awk '{print $3}'|xargs cat)
flag=$(ssh $remoteUserName"@"$remoteIP '(cat .ssh/authorized_keys)' | grep $pub_key | wc -w)
if [[ flag -ge 1 ]]
then
echo "Public key for "$userName" already exists"
else
echo "Copying key for "$userName"."
ssh-copy-id -i $pub_key_path $remoteUserName"@"$remoteIP
fi
done

