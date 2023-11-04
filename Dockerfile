# Use an official Node.js runtime as the base image
FROM node:12.5.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Expose a port (usually 80) for the container to listen on
EXPOSE 80

# Command to start the application
CMD ["npm", "start"]

