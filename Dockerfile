
FROM node:16.13.1 As build
WORKDIR /usr/app
COPY . /usr/app
RUN npm install
RUN npm run build

FROM httpd:2.4
COPY --from=build /usr/app/build /usr/local/apache2/htdocs/
