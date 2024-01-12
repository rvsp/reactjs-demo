# Use the official Node.js image as a base image
FROM node:14-alpine

# Set the working directory within the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

RUN npm run build
# Expose the port that the app will run on
EXPOSE 80

# Command to run the application
CMD ["npx", "serve", "-s", "build", "-l", "80"]
