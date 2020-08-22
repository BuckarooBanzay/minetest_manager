# Stage 1 testing
FROM node:14.7.0-alpine

COPY package.json /app/
COPY package-lock.json /app/
COPY .jshintrc /app/
COPY src /app/src

RUN cd /app && npm i && npm test


# Stage 2 package
FROM node:14.7.0-alpine

COPY package.json /app/
COPY package-lock.json /app/
COPY src /app/src

RUN cd /app && npm i --only=production

WORKDIR /app

EXPOSE 8080

CMD ["npm", "start"]
