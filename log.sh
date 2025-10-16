echo "enter the service name "
read service

echo " enter the no. of log line"
read lines

OUTPUT_FILE="/home/kunal/Desktop/linux/backup/${service}_log.txt"

sudo journalctl -u "$service" -n "$lines" > "$OUTPUT_FILE"

echo "log save to: $OUTPUT_FILE"
cat "$OUTPUT_FILE"
