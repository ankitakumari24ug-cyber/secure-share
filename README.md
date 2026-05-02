# Secure Share

This project is a secure file sharing tool using SSH and age encryption.

## Features
- Encrypt file
- Secure transfer using SCP
- Decrypt file
- Verify integrity using checksum
- Logging system

## How to run

1. Setup keys:
   ./setup_keys.sh

2. Send file:
   ./send.sh file.txt user ip PUBLIC_KEY

3. Receive file:
   ./receive.sh file.txt.age
