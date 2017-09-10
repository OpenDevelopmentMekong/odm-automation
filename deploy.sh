#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Please specify component as parameter [ckan|wp]"
  exit
fi

if [ -z "$2" ]; then
  echo "Please specify environment as parameter [dev|prod|local|staging|vm]"
  exit
fi

if [[ "$2" == "local" ]]; then
  /home/vagrant/ansible/bin/ansible-playbook ansible/$1.yml -i ansible/stage-$2 -u root --connection=local -vvvv
else
  ansible-playbook ansible/$1.yml -i ansible/stage-$2 -u root -vvv
fi
