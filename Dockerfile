FROM node:16-alpine as build 

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build 

FROM nginx:alpine

WORKDIR /usr/share/nginx/html/

COPY --from=build /app/build .

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
