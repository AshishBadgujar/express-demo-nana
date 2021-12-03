FROM node:13-alpine

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

COPY ./app/package.json /home/app
# will execute npm install in /home/app because of WORKDIR
RUN npm install

COPY ./app /home/app

# no need for /home/app/server.js because of WORKDIR
CMD ["npm", "start"]

