#!/bin/bash

BASEDIR=$(dirname $0)

# Install the Ansible roles
# ansible-galaxy install -r $BASEDIR/roles.yml

# Install updates
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/os-updates.yml

# Reboot the server
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/reboot.yml

# Install VS Code Server
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/vscode-server.yml

# Install the other required packages
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/playbook.yml

# Install the Cloudflare Agent
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/cloudflare-agent.yml
