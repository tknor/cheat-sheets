#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

script_start

ku_switch_and_set_service $1 $2

kubectl describe service $VAR_SERVICE | grep Endpoint
