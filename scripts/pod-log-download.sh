#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

ku_switch_and_set_pod_and_porting $1 $2

download_logs_from_pod "$VAR_POD" "$VAR_ENV-$VAR_RESOLVED_POD_PART"
