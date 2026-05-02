#!/bin/bash

echo "Generating SSH key..."
ssh-keygen -t ed25519

echo "Generating AGE key..."
age-keygen -o key.txt

echo "Keys setup complete"