FROM node:14-alpine

WORKDIR /app

RUN apk update && apk add git

RUN git clone https://github.com/oooTUXED0ooo/reactjs-demo.git .

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
