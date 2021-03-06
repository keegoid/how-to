#!/bin/bash

# how to setup aws and cloud9 IDE

# aws version 1
# activate venv
pip3 install awscli --upgrade

# aws version 2
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "~/.venv/bin/aws2_src/awscliv2.zip"

# extract awscliv2.zip using Files app
./install -i ~/.venv/aws-cli -b ~/.venv/bin

# make sure python, python3, aws, and aws2 are all in .venv/bin
which python
which python3
which aws
which aws2

aws --version
aws2 --version

# configure aws cli
aws configure
aws2 configure

# configure for a different profile
aws configure --profile producer
aws2 configure --profile producer

# run a command
aws s3 ls
aws2 s3 ls

# run a command as profile user
aws s3 ls --profile producer
aws2 s3 ls --profile producer
