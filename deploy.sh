#!/bin/bash
# Navigate to the Jenkins workspace where the latest code is pulled
cd /var/lib/jenkins/workspace/my-node-app

# Install dependencies and restart/reload PM2
npm install --production

# Check if PM2 is running the app, otherwise start it fresh
if pm2 list | grep -q "my-node-app"; then
  pm2 reload my-node-app
else
  pm2 start index.js --name "my-node-app"
fi

pm2 save
echo "Deployment successful!"
