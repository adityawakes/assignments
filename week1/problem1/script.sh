echo "Count HTTPCode" > output.txt
cat web-server.log |awk '{print $9}' | sort | uniq -c | sort -nr >> output.txt
