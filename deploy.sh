#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Please specify component as parameter [ckan|wp]"
  exit
fi

if [ -z "$2" ]; then
  echo "Please specify environment as parameter [dev|prod|local]"
  exit
fi

if [ "$2" == "prod" ]; then
 echo "Production environment not supported yet"
 exit
fi

ansible-playbook ansible/$1-$2.yml -i ansible/stage -u root -vvvv
