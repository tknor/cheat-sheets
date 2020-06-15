#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

winpty docker exec -it $1 sh
