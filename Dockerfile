# Stage 1: Build the React app
FROM node:14 as development
WORKDIR /usr/src/react-app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the production image with Nginx
FROM nginx:latest as production
COPY --from=development /usr/src/react-app/build /usr/share/nginx/html
EXPOSE 80

# Set the TTY and stdin_open options
ENV TTY=true
ENV STDIN_OPEN=true

CMD ["nginx", "-g", "daemon off;"]

