#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Please specify component as parameter [ckan|wp]"
  exit
fi

if [ -z "$2" ]; then
  echo "Please specify environment as parameter [dev|prod|local|staging]"
  exit
fi

cd ansible/
ansible-playbook $1.yml -i stage-$2 -u root -vvvv
