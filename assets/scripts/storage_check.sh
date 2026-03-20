#!/bin/bash
#storage Sentinel v1.0

#Define the log of findings
REPORT="/tmp/storage_report.txt"

echo "--- INFRASTRUCTURE STORAGE AUDIT: $(date) ---" > $REPORT

# Identify FS exceeting 80%
#use awk to parse the percentage column
#df -h /dev/sda | awk '$5 > 80 {print "CRITICAL: " $1 " is at " $5}' >> $REPORT
#df -h /dev/sda | awk '/\/dev\/sda/ {print $5}' >>$REPORT
#df -h /dev/sda | awk 'NR > 1 { sub(/%/, "", $5); if($5 < 80) print "CRITICAL: " $1 " is at " $5 "%" }' >>$REPORT
df -h /dev/sda | awk 'NR > 1 { sub(/%/, "", $5); if($5 > 80) print "CRITICAL: " $1 " is at " $5 "%" }' >>$REPORT
#Direct standard errot to null to avoid hanups
ls /nonexistent_test_path 2> /dev/null

echo "Audit complete. Results archive in $REPORT."

