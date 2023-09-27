FROM node:16.3.0-alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
COPY . ./
CMD ["npm", "start"]

