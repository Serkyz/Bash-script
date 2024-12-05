OUTPUT_FILE="Output.log"

> "$OUTPUT_FILE"

run_nmap(){
    echo "=== Nmap Scan Result ===" >> "$OUTPUT_FILE"
    nmap -sS -p 1-1024 localhost >> "$OUTPUT_FILE" 2>&1
    echo "Nmap scan сompleted" >> "$OUTPUT_FILE"
}

run_tcpdump() {
    echo "=== Tcpdump Packet Capture ===" >> "$OUTPUT_FILE"
    echo "Запуск tcpdump на 5 секунд..." >> "$OUTPUT_FILE"
    timeout 5 tcpdump -i lo -c 50 >> "$OUTPUT_FILE" 2>&1
    echo "Tcpdump завершено." >> "$OUTPUT_FILE"
}

echo "Run the script..."
run_nmap
run_tcpdump
echo "All results are recorded in $OUTPUT_FILE"

exit 0
}