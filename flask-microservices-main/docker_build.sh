#!/bin/bash

docker login -u $DOCKER_USER -p $DOCKER_PASS
docker pull $DOCKER_USER/$USERS
docker pull $DOCKER_USER/$USERS_DB
docker pull $DOCKER_USER/$CLIENT
docker pull $DOCKER_USER/$SWAGGER
docker pull $DOCKER_USER/$NGINX

docker-compose up -d --build