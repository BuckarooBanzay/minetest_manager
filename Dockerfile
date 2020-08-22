# Stage 1 testing
FROM node:14.8.0-alpine

COPY ./package.json /app/
COPY ./package-lock.json /app/
COPY ./.jshintrc /app/

COPY ./test /app/test
COPY ./src /app/src
COPY ./public /app/public

RUN ls -lha /app

RUN cd /app &&\
 npm ci &&\
 npm test &&\
 npm run bundle


# Stage 2 package
FROM node:14.8.0-alpine

COPY package.json /app/
COPY package-lock.json /app/
COPY src /app/src
COPY public /app/public

RUN cd /app &&\
 npm ci --only=production

WORKDIR /app

EXPOSE 8080

CMD ["npm", "start"]
