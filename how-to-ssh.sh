#!/bin/bash

# scan public ssh keys from remote host and add to known_hosts file
ssh-keyscan -p 49996 -t ecdsa raspberry-pi >> .ssh/known_hosts