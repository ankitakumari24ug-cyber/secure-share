#!/bin/bash

FILE=$1

if [ -z "$FILE" ]; then
  echo "Usage: ./receive.sh filename.age"
  exit 1
fi

echo "Decrypting file..."
age -d -i key.txt -o decrypted_$FILE $FILE

if [ $? -ne 0 ]; then
  echo "Decryption failed"
  exit 1
fi

echo "Verifying checksum..."

# Check if checksum file exists
if [ ! -f "$FILE.sha256" ]; then
  echo "Checksum file missing"
  exit 1
fi

EXPECTED=$(cat $FILE.sha256)
ACTUAL=$(sha256sum decrypted_$FILE | awk '{print $1}')

if [ "$EXPECTED" = "$ACTUAL" ]; then
  echo "Integrity Verified ✅"
  STATUS="SUCCESS"
else
  echo "File Tampered ❌"
  STATUS="FAILED"
fi

# Logging
echo "$(date) | receiver | $FILE | $STATUS" >> transfer.log

echo "Process completed"
