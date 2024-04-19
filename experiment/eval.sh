#!/bin/bash
export cwd=$(pwd)

GIT_SSH_COMMAND="ssh -i ${cwd}/id_ed25519 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone --single-branch --branch jb git@github.com:feji3769/chtc.git project

# simlink
ln -s ${cwd}/* /workspace/

cp /staging/brachem/something.txt .

/opt/conda/bin/python3 /workspace/project/experiments/eval.py \
    --seed=$1

rm -rf project
rm -rf something.txt
