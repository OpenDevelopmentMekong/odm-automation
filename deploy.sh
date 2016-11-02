#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Please specify component as parameter [ckan|wp]"
  exit
fi

if [ -z "$2" ]; then
  echo "Please specify environment as parameter [dev|prod|local|staging]"
  exit
fi

ansible-playbook ansible/$1.yml -i ansible/stage-$2 -u root -vvvv
