#!/bin/bash

CONST_CHEATS_FOLDER=~/Workspaces/Git/cheat-sheets
CONST_SCRIPTS_FOLDER=$CONST_CHEATS_FOLDER/scripts/
CONST_SCRIPTS_LOCAL_FOLDER=$CONST_CHEATS_FOLDER/scripts/local
CONST_SCRIPTS_LOCAL_BACKUP_FOLDER=~/Data/scripts-local-backup
CONST_TEMP_FOLDER=~/Desktop/temp

. $CONST_SCRIPTS_FOLDER/common.sh

# params:
# 1 env short name
# result in TEMP
function env() {
  if [[ $1 == "x" ]]; then
    TEMP="xxx"
  else
    phase "unrecognized environment '$1'"
    exit 1
  fi
}

# params:
# 1 env short name
# result in TEMP
function ku_switch() {
  env $1
  kubectl config use-context $TEMP
}

# params:
# 1 env short name
# 2 pod short name
# result in TEMP
function pod() {
  if [[ $2 == "x" ]]; then
    pod_name "xxx"
  else
    phase "unrecognized pod '$2'"
    exit 1
  fi
}

# params:
# 1 env short name
# 2 service short name
# result in TEMP
function service() {
  if [[ $2 == "x" ]]; then
    TEMP="xxx"
    phase "service = '$TEMP'"
  else
    phase "unrecognized service '$2'"
    exit 1
  fi
}

# params:
# 1 env short name
# 2 pod short name
# result in TEMP
function porting() {
  if [[ $2 == "x" ]]; then
    TEMP="8080:8080"
  else
    phase "unrecognized pod '$2', setting default 8080:8080"
    TEMP="8080:8080"
  fi
}

# params:
# 1 env short name
# 2 pod short name
# result in VAR_ENV, VAR_POD, VAR_PORTING
function ku_switch_and_set_pod_and_porting() {
  ku_switch $1
  VAR_ENV=$TEMP
  pod $1 $2
  VAR_POD=$TEMP
  porting $1 $2
  VAR_PORTING=$TEMP
}

# params:
# 1 env short name
# 2 service short name
# result in VAR_ENV, VAR_SERVICE
function ku_switch_and_set_service() {
  ku_switch $1
  VAR_ENV=$TEMP
  service $1 $2
  VAR_SERVICE=$TEMP
}
