FROM node:14 as dev
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package-lock.json* ./
RUN npm install
COPY . /usr/src/app
RUN npm run build
FROM nginx:latest
COPY --from=dev /usr/src/app/build /usr/share/nginx/html
EXPOSE 80	
CMD ["nginx", "-g", "daemon off;"]
