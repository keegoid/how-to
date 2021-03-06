#!/bin/bash

# get help with a command
ansible-doc debug

# working with ansible-vault
ansible-vault create inventory
ansible-vault view inventory
ansible-vault encrypt inventory

# decrypt inventory file
ansible-playbook playbook.yml -i inventory --ask-vault-pass
ansible-playbook playbook.yml -i inventroy --vault-password-file ~/.ansible-vault

# search galaxy for roles
ansible-galaxy search mysql

# create an ansible-galaxy template
ansible-galaxy init mysql_db
ansible-galaxy init flask_web

# run a playbook
ansible-playbook playbook.yml -i inventory.txt

# ansible become user with sudo (K ask for password, b become user u)
ansible miner1 -a "grep ^root: /etc/shadow" -Kbu cminer

# when not using an SSH keypair (k to ask for SSH password, K to ask for sudo password)
ansible miner1 -a "grep ^root: /etc/shadow" -kKbu cminer

# create a directory on remote server raspberry-pi
ansible rasp* -m file -a 'dest=~/repos state=directory'

# copy a file to the newly created directory on remote server, not single quotes so variables expand on server
ansible rasp* -m copy -a 'src=~/testfile1.md dest=~/repos/testfile1.md'

# ensure a package is installed on server
ansible rasp* -m yum -a "name=acme state=present"
ansible rasp* -m yum -a "name=acme-1.5 state=present"

# set to latest version
ansible rasp* -m yum -a "name=acme state=latest"

# check that a package does not exist on the server
ansible rasp* -m yum -a "name=acme state=absent"

# check that a service has been started or stopped
ansible rasp* -m service -a "name=httpd state=started"
ansible rasp* -m service -a "name=httpd state=stopped"

# restart a service
ansible rasp* -m service -a "name=httpd state=restart"

# mamange users add/remove
ansible rasp* -m user -a "name=foo password=<crypted password here>"
ansible rasp* -m user -a "name=foo state=absent"

# get details about the remote server
ansible rasp* -m setup

# list inventory
ansible-inventory --list

