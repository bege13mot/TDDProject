#!/bin/bash

docker login -u $DOCKER_USER -p $DOCKER_PASS
docker pull $DOCKER_ID/$USERS
docker pull $DOCKER_ID/$USERS_DB
docker pull $DOCKER_ID/$CLIENT
docker pull $DOCKER_ID/$SWAGGER
docker pull $DOCKER_ID/$NGINX

docker-compose up -d --build