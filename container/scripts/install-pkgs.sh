apt-get update &&\
apt-get upgrade -y &&\
DEBIAN_FRONTEND="noninteractive" apt-get install $(cat /cfg/pkglist) -y