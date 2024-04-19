#!/bin/bash
export cwd=$(pwd)
GIT_SSH_COMMAND="ssh -i ${cwd}/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:feji3769/chtc.git project
ln -s ${cwd}/* /workspace/

cp /staging/fjimenez2/something.txt .

/opt/conda/bin/python3 /workspace/project/experiments/eval.py \
    --seed=$1

rm -rf project
rm -rf something.txt