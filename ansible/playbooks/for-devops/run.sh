#!/bin/bash

BASEDIR=$(dirname $0)

if [ "$1" = "enabled" ]
then
    # Install the Ansible roles
    # ansible-galaxy install -r $BASEDIR/roles.yml

    # Run the playbook
    ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/playbook.yml
fi
