#!/bin/bash

BASEDIR=$(dirname $0)

# Install Cloudflare Agent & configure Cloudflare Access Tunnel
ansible-playbook -i $BASEDIR/../../hosts.yml $BASEDIR/playbook.yml
