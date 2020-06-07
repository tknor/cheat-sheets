#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

script_start

ku_switch_and_set_pod_and_porting $1 $2

echo "Delete pod '$VAR_POD' on '$VAR_ENV'?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) delete_pod $VAR_POD; break;;
        No ) exit;;
    esac
done
