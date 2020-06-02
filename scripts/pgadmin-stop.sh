#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

phase "stopping pgadmin"
docker-compose -f docker-compose/pgadmin.yml down
