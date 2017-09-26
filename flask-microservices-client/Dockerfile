FROM node:latest

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add environment variables
ARG REACT_APP_USERS_SERVICE_URL
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV
ENV REACT_APP_USERS_SERVICE_URL=$REACT_APP_USERS_SERVICE_URL

# install and cache app dependencies
ADD package.json /usr/src/app/package.json
RUN ls
#RUN rm -rf node_modules
#RUN npm cache clear --force
#RUN npm install npm@3.10.10
#RUN rm -rf node_modules
#RUN npm cache clear --force
RUN npm install react react-dom react-scripts web-service -g --silent --save
RUN npm install pushstate-server -g --silent

# add `/usr/src/app/node_modules/.bin` to $PATH
#ENV PATH /usr/src/app/node_modules/.bin:$PATH

# add app
COPY . /usr/src/app
RUN ls

# build react app
RUN npm run build

# start app
CMD ["pushstate-server", "build"]