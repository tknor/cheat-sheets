#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

kubectl config use-context $(env_resolve $1)
