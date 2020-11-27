#!/bin/bash

CONST_CHEATS_FOLDER=~/Workspaces/Git/cheat-sheets
CONST_SCRIPTS_FOLDER=$CONST_CHEATS_FOLDER/scripts/
CONST_SCRIPTS_LOCAL_FOLDER=$CONST_CHEATS_FOLDER/scripts/scripts-local
CONST_UFR_FOLDER=~/Desktop
CONST_TEMP_FOLDER=~/Desktop/temp

. $CONST_SCRIPTS_FOLDER/common.sh

# params:
# 1 env short name
function env_resolve() {
  if [[ $1 == "d" ]]; then
    echo "dev"
  elif [[ $1 == "t" ]]; then
    echo "test"
  else
    phase "UNRESOLVED_ENVIRONMENT"
  fi
}

# params:
# 1 env short name
# 2 pod short name
function pod_resolve() {
  if [[ $2 == "x" ]]; then
    echo "xxx"
  elif [[ $2 == "y" ]]; then
    echo "yyy"
  else
    echo "UNRESOLVED_POD"
  fi
}

# params:
# 1 env short name
# 2 pod short name
function pod_container_resolve() {
  if [[ $2 == "x" ]]; then
    echo "xxx"
  else
    echo ""
  fi
}

# params:
# 1 env short name
# 2 service short name
function service_resolve() {
  if [[ $2 == "x" ]]; then
    echo "xxx"
  elif [[ $2 == "y" ]]; then
    echo "yyy"
  else
    echo "UNRESOLVED_SERVICE"
  fi
}

# gets port forwarding setting by pod short name
# params:
# 1 env short name
# 2 pod short name
function porting_resolve() {
  if [[ $2 == "x" ]]; then
    echo "8080:8080"
  elif [[ $2 == "y" ]]; then
    echo "8080:8080"
  else
    echo "UNRESOLVED_PORTING"
  fi
}

# params:
# 1 env short name
# 2 pod short name
# result in VAR_ENV, VAR_POD, VAR_PORTING
function ku_switch_and_set_pod_and_porting() {

  VAR_ENV=$(env_resolve $1)
  ku_switch $VAR_ENV

  VAR_RESOLVED_POD_PART=$(pod_resolve $1 $2)
  VAR_RESOLVED_POD_CONTAINER=$(pod_container_resolve $1 $2)

  if [ -z "$VAR_RESOLVED_POD_CONTAINER" ]; then
    VAR_POD="$(pod_name_from_name_part $VAR_RESOLVED_POD_PART)"
  else
    VAR_POD="$(pod_name_from_name_part $VAR_RESOLVED_POD_PART) -c $VAR_RESOLVED_POD_CONTAINER"
  fi

  VAR_PORTING=$(porting_resolve $1 $2)

  phase "switched, VAR_ENV = '$VAR_ENV', VAR_POD = '$VAR_POD', VAR_PORTING = '$VAR_PORTING'"
}

# params:
# 1 env short name
# 2 service short name
# result in VAR_ENV, VAR_SERVICE
function ku_switch_and_set_service() {

  VAR_ENV=$(env_resolve $1)
  ku_switch $VAR_ENV

  VAR_SERVICE=$(service_resolve $1 $2)

  phase "switched, VAR_ENV = '$VAR_ENV', VAR_SERVICE = '$VAR_SERVICE'"
}
