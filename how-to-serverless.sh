#!/bin/bash

# shortcut serverless command
sls

# serverless config
sls config credentials --provider aws --key XXX --secret XXX --profile serverless-admin

# create new project from template at path
sls create --template aws-python --path hello-world-python
sls create -t aws-nodejs -p nodejs-example

# deploy function
sls deploy -v

# invoke a function from the terminal with log output
sls invoke -lf hello

# see the logs in chronological order (tail) streaming near real-time
sls logs -tf hello