# Use official lightweight Node image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package management files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source code
COPY . .

# Expose app port
EXPOSE 3000

# Start application
CMD ["node", "index.js"]
