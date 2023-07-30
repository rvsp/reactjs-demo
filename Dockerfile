# Development Stage
FROM node:14 as development
WORKDIR /usr/src/react-app
COPY package*.json ./
RUN npm install --quiet
COPY . .

# Build the React app
RUN npm run build

# Production Stage
FROM nginx:alpine as production
COPY --from=development /usr/src/react-app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
