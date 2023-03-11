FROM nginx:latest

RUN rm -f /usr/share/nginx/html/index.html

COPY . /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
