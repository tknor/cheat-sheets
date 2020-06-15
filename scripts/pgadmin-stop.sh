#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "stopping pgadmin"
docker-compose -f docker-compose/pgadmin.yml down
