#!/bin/bash

# add speedtest-cli from speedtest.net
pkg update ; pkg install -y py27-speedtest-cli

# list servers
speedtest --list

# test with a spcific server
speedtest --server 18533