#!/bin/bash

if [ "$TRAVIS_BRANCH" == "master" ]; then
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  export TAG=`if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo $TRAVIS_BRANCH ; fi`
  # users
  cd ../flask-microservices-users
  docker build . -t $USERS:$COMMIT
  docker tag $USERS:$COMMIT $DOCKER_USER/$USERS:$TAG
  docker push $DOCKER_USER/$USERS
  # users db
  cd ../flask-microservices-users/project/db
  docker build . -t $USERS_DB:$COMMIT
  docker tag $USERS_DB:$COMMIT $DOCKER_USER/$USERS_DB:$TAG
  docker push $DOCKER_USER/$USERS_DB
  # client
  cd ../flask-microservices-client
  docker build . -t $CLIENT:$COMMIT
  docker tag $CLIENT:$COMMIT $DOCKER_USER/$CLIENT:$TAG
  docker push $DOCKER_USER/$CLIENT
  # swagger
  cd ../flask-microservices-swagger
  docker build . -t $SWAGGER:$COMMIT
  docker tag $SWAGGER:$COMMIT $DOCKER_USER/$SWAGGER:$TAG
  docker push $DOCKER_USER/$SWAGGER
  # nginx
  cd ./nginx/
  docker build . -t $NGINX:$COMMIT
  docker tag $NGINX:$COMMIT $DOCKER_USER/$NGINX:$TAG
  docker push $DOCKER_USER/$NGINX
fi