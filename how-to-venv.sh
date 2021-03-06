#!/bin/bash

# activate and deactivate python virtual environment
source venv/bin/activate
pip freeze > requirements.txt
pip uninstall -r requirements.txt -y
deactivate
rm -r venv/

# list pips with versions
pip3 list -o

# upgrade pips
pip3 install --upgrade awscli
