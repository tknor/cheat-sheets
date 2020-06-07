#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

script_start

winpty docker exec -it $1 sh
