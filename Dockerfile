FROM node:14.13.1-alpine3.12
LABEL author="rabchev"
LABEL project="web-terminal"

WORKDIR /usr/src

COPY package.json .

RUN [ "npm", "install" ]

COPY . .

WORKDIR /home

ENTRYPOINT [ "node", "/usr/src/bin/run.js", "--port", "8088" ]
