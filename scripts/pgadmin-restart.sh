#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

phase "stopping pgadmin"
docker-compose -f docker-compose/pgadmin.yml down

phase "starting pgadmin"
docker-compose -f docker-compose/pgadmin.yml up -d

docker container ls | grep pgadmin
