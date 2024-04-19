# chtc
items for submitting to chtc


## Update the scripts

1. Update eval.sh with correct filepaths
2. Update container/build.sh
    - Name of the docker image
    - User ID and group ID on the remote server
    - Git info
3. Update eval.sub with correct filepaths and docker image



## Build the docker image

```
cd container
sh build.sh
```


## Push the docker image to DockerHub