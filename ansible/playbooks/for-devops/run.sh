#!/bin/bash

BASEDIR=$(dirname $0)

# Install the Ansible roles
ansible-galaxy install -r $BASEDIR/roles.yml

# Run the playbook
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/playbook.yml
