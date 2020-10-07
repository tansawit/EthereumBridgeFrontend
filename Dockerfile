FROM node:latest
EXPOSE 3000

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json package-lock.json /app/

RUN npm install

COPY . /app/

RUN npm run build
RUN npm install -g serve

RUN tar cfz ethhmy-bridge-fe.tgz build
