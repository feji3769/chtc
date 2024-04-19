#/bin/bash
docker build \
    -t jobrachem/chtc_test:image.1 \
    --no-cache\
    --build-arg UID=26064 \
    --build-arg GID=26064 \
    --build-arg DOCKER_USER=jobrachem \
    --build-arg GIT_EMAIL="jobrachem@posteo.de" \
    --build-arg GIT_USERNAME=jobrachem .
