#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

pod_name_from_name_part $(pod_resolve $1 $2)
