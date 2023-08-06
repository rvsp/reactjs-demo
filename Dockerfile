FROM node:14-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . ./
EXPOSE 80
CMD [ "npm","start" ]
