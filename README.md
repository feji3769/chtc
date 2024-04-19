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
5. Run `id -u` to access your user ID and note that ID down.
6. Create an account on Dockerhub and install Docker on your local machine

## Update the scripts

1. Update container/build.sh
2. Update eval.sh
3. Update eval.sub


## Build the docker image

Building the image might take a while.

```
cd container
sh build.sh
```

After building is done, push the image to Dockerhub.


## Run the job on the CHTC

### Pull your repository to the server

Something like this:

```
ssh <NAME>
mkdir projects
cd projects
git clone <REPO>
```

Make sure that you are in the correct branch and pull the latest changes.

### Create the run directories

The submit file `eval.sub` contains the following line:

```
initialdir = runs/Run$(Process)
```

This means that, for each process that is started, an individual directory will be
used to store log files and output, e.g. `experiment/runs/Run0`, `experiment/runs/Run1`,
etc.

You need to create these directories submitting the job; they will *not* be created
automatically. The number of processes is equal to the number of rows in 
`experiment/params.txt` - but beware that process counting starts at `0`.

### Submit the job

To submit the job, you change into the experiment directory and run:

```
cd ~/projects/chtc/experiment # maybe you need to update this filepath
condor_submit eval.sub
```

### Monitor your run

On the server, you can run the following code to see the status of your job:

```
condor_q
```

More detailed output is achieved with this command:

```
condor_q ana
```

## Handle the output of your runs

Generally, all files you create during a run will be located in the
`/experiment/runs/Run[i]` directory and persist after your run is finished. 
However, storage is limited. 
You should therefore write your `experiment/eval.sh` in such a way that you
move any output that you save from a run to your `/staging/[NETID]` directory and
delete the additional files in the `/experiment/runs/Run[i]` immediately.

### Remote tracking

You may want to check out [Weights & Biases](https://wandb.ai/site) or 
[MLFlow](https://mlflow.org) for remote tracking of your runs.
