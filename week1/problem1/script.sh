#! /bin/zsh
echo "Count HTTPCode" > countAll.txt
cat web-server.log |awk '{print $9}' | sort | uniq -c | sort -nr >> countAll.txt
cat countAll.txt | awk '{if($2 == 200) print $1}' >> count200.txt

