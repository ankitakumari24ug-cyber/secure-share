#!/bin/bash

FILE=$1

echo "Decrypting file..."
age -d -i key.txt -o decrypted_$FILE $FILE

echo "Verifying checksum..."
sha256sum decrypted_$FILE

echo "File received and decrypted"