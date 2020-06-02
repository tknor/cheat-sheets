#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

ku_switch_and_set_pod_and_porting $1 $2

show_logs_from_pod $VAR_POD
