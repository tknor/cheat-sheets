#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

if [[ $1 == "u" ]]; then
  header2 "starting pgadmin"
  docker-compose -f $ffs/docker-compose/pgadmin.yml up -d

elif [[ $1 == "d" ]]; then
  header2 "stopping pgadmin"
  docker-compose -f $ffs/docker-compose/pgadmin.yml down

else
  header2 "what with it?"
  exit 1
fi
