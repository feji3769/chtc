#/bin/bash
docker build \
    -t [UPDATE_DOCKERHUB_USERNAME]/[UPDATE_DOCKERHUB_REPO]:[UPDATE_DOCKER_IMAGE_TAG] \
    --no-cache\
    --build-arg UID=[UPDATE_USER_ID] \
    --build-arg GID=[UPDATE_GROUP_ID] \
    --build-arg DOCKER_USER=[UPDATE_DOCKERHUB_USERNAME] \
    --build-arg GIT_EMAIL="[UPDATE_GIT_EMAIL]" \
    --build-arg GIT_USERNAME=[UPDATE_GIT_USERNAME] .
