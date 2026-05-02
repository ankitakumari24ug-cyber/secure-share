#!/bin/bash

FILE=$1
USER=$2
IP=$3
PUBKEY=$4

if [ ! -f "$FILE" ]; then
  echo "Error: File not found"
  exit 1
fi

echo "Generating checksum..."
CHECKSUM=$(sha256sum $FILE | awk '{print $1}')
echo $CHECKSUM > $FILE.sha256

echo "Encrypting file..."
age -r $PUBKEY -o $FILE.age $FILE

echo "Sending file..."
scp $FILE.age $USER@$IP:/tmp/

echo "$(date) | sender | $USER@$IP | $FILE | sha256:$CHECKSUM | SUCCESS" >> transfer.log

echo "File sent successfully"