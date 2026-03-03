#!/bin/bash
# This script runs automatically when EC2 starts for the first time
# It installs Node.js, PM2, and starts your server

set -e  # stop on any error

# Update system packages
apt-get update -y
apt-get upgrade -y

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Install PM2 globally (keeps Node server alive)
npm install -g pm2

# Create app directory
mkdir -p /home/ubuntu/notes-app
chown ubuntu:ubuntu /home/ubuntu/notes-app

# Install git (to pull your backend code)
apt-get install -y git

# Log that setup is done
echo "✅ Node.js $(node -v) installed" >> /var/log/setup.log
echo "✅ PM2 installed" >> /var/log/setup.log
echo "✅ Setup complete — SSH in and deploy server.js" >> /var/log/setup.log

# After SSH-ing in, you run:
# cd notes-app && npm install
# pm2 start server.js --name "notes-api"
# pm2 startup && pm2 save