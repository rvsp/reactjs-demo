# Set working directory
WORKDIR /usr/src/react-app

# Copy package.json and package-lock.json to leverage Docker cache for npm install
COPY package*.json ./

# Install dependencies
RUN npm install --quiet

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Create the production image with Nginx
FROM nginx:alpine as production

# Copy the built React app from the development stage to Nginx
COPY --from=development /usr/src/react-app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Set the TTY and stdin_open options
ENV TTY=true
ENV STDIN_OPEN=true

# Start Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
