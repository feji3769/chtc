FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-devel

# build and fill directories.
RUN mkdir /cfg /build &&\
    chmod 755 /cfg &&\
    chmod 777 /build


ADD ./config/* /cfg/.
ADD ./scripts/* /build/.
RUN chmod +x /build/*

RUN /build/install-pkgs.sh\
    /build/additional-pip-install.sh


ARG DOCKER_USER
ARG UID
ARG GID
ARG GIT_USERNAME
ARG GIT_EMAIL

RUN groupadd -g $GID $DOCKER_USER &&\
    useradd -u $GID -g $GID -s /bin/bash $DOCKER_USER -m&&\
    mkdir /datasets &&\
    chown -R $UID:$GID /workspace /datasets

USER $DOCKER_USER

RUN /build/git-config.sh $GIT_USERNAME $GIT_EMAIL

