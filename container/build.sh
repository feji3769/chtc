#/bin/bash
docker build \
    -t felixj3/pskips:nothing.0.0.0 \
    --no-cache\
    --build-arg UID=25666 \
    --build-arg GID=25666 \
    --build-arg DOCKER_USER=fjimenez2 \
    --build-arg GIT_EMAIL="felix.m.jimenez3@gmail.com" \
    --build-arg GIT_USERNAME=feji3769 .
