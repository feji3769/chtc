# CHTC

This repository contains the basic structure of code to submit to the 
Center for High Throughput Computing (CHTC) clusters. 
Follow this link for more information: https://chtc.cs.wisc.edu


## Prerequisites

1. Request an account: https://chtc.cs.wisc.edu/uw-research-computing/form.html
2. Update your SSH config in order to be able to ssh into the server

```
Host [NAME] # your nickname for the server
    User [USERNAME] # your username on the server (your netid)
	Hostname ap2002.chtc.wisc.edu # server address (might be different than this one, check your account creation confirmation email)
    ControlMaster auto # Makes sure that you do not have to re-authenticate every time you log in
    ControlPersist 2h
    ControlPath ~/.ssh/connections/%r@%h:%p% # If ~/.ssh/connections does not exist, create it
```

3. Create an SSH key on the server. You can follow [GitHubs guide](https://docs.github.com/de/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. Add the server's public SSH key to your GitHub account in your account settings.

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


## Run the job on the CHTC

1. Create the run directories


```
cd ~/git/chtc/experiment
condor_submit eval.sh
```

## Monitor

```
condor_q
```

More detailed output.

```
condor_q ana
```


