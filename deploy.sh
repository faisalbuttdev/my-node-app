#!/bin/bash
set -e

echo "Starting deployment..."
npm install --production

# Check if PM2 process is already running
if pm2 list | grep -q "my-node-app"; then
  echo "Reloading existing PM2 process..."
  pm2 reload my-node-app
else
  echo "Starting new PM2 process..."
  pm2 start index.js --name "my-node-app"
fi

pm2 save
echo "Deployment successful!"
