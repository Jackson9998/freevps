#!/bin/bash

# Step 1: Create an administrative user
echo "Creating administrative user..."
sudo dscl . -create /Users/hdz UserShell /bin/bash
sudo dscl . -create /Users/hdz RealName "Humberto"
sudo dscl . -create /Users/hdz UniqueID 1001
sudo dscl . -create /Users/hdz PrimaryGroupID 80
sudo dscl . -create /Users/hdz NFSHomeDirectory /Users/hdz
sudo dscl . -passwd /Users/hdz Humberto@#123
sudo dscl . -append /Groups/admin GroupMembership hdz

# Step 2: Configure RDP usage (Não aplicável no MacOS)
echo "Configuring RDP... (Not applicable on MacOS)"

# Step 3: Download and install Ngrok
echo "Downloading and installing Ngrok..."
curl -L -o /tmp/Ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip
unzip /tmp/Ngrok.zip -d /tmp

# Step 4: Open port 3389 using Ngrok
echo "Opening port 3389 with Ngrok..."
export ngrokAuthToken="25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M"
while true; do
  /tmp/ngrok authtoken $ngrokAuthToken
  /tmp/ngrok tcp 3389

  # Wait for 5 seconds before repeating the loop
  sleep 5
done
