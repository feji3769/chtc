#!/bin/bash
export cwd=$(pwd)

GIT_SSH_COMMAND="ssh -i ${cwd}/[UPDATE_SSH_KEY_NAME] -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone [UPDATE_YOUR_GIT_REPO] project

# simlink
ln -s ${cwd}/* /workspace/

cp /staging/[UPDATE_YOUR_NETID]/something.txt .

/opt/conda/bin/python3 /workspace/project/experiments/eval.py

rm -rf project
rm -rf something.txt
