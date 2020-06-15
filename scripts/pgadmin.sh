#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

if [[ $1 == "u" ]]; then
  phase "starting pgadmin"
  docker-compose -f $ffs/docker-compose/pgadmin.yml up -d

elif [[ $1 == "d" ]]; then
  phase "stopping pgadmin"
  docker-compose -f $ffs/docker-compose/pgadmin.yml down

else
  phase "what with it?"
  exit 1
fi
