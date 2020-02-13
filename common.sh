#!/bin/bash

# flagged for removal
# CONST_CHEATS_FOLDER=~/Workspaces/Git/cheat-sheets

# OPTIONS:
# w - will not wait in the end
# x - will output commands

VAR_X_OPTION=0
VAR_W_OPTION=0

while getopts "xw" option; do
	case "${option}" in
		x) VAR_X_OPTION=1;;
		w) VAR_W_OPTION=1;;
	esac
 done

function separator() {
	printf "\n"
}

function phase() {
	printf "\n -> $1\n\n"
}

function script_end {
	
if [[ $VAR_W_OPTION != 1 ]]; then
    phase "press any key to continue"
    read -n 1 -s -r
fi
	
}

function script_start() {

    set -e
    set -u

	if [[ $VAR_X_OPTION == 1 ]]; then
		set -x
	fi

	trap script_end EXIT
}

function stop_docker_container() {

	phase "stopping container '$1'"
	VAR_CONTAINER=$(docker container ls -aqf "name=^$1$")
	if [[ $VAR_CONTAINER ]]; then
		docker stop $VAR_CONTAINER
	fi
}

function stop_and_remove_docker_containers() {

	phase "stopping and removing all containers"
	VAR_CONTAINERS=$(docker container ls -aq)
	if [[ $VAR_CONTAINERS ]]; then
		docker container rm -f $VAR_CONTAINERS
	fi
}

function pod_name() {
	VAR_POD_NAME=$(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
}

function open_bash_to_pod() {
	winpty kubectl exec -it $VAR_POD_NAME bash
}

function open_sh_to_pod() {
	winpty kubectl exec -it $VAR_POD_NAME sh
}

function port_forward_from_pod() {
	kubectl port-forward $VAR_POD_NAME $1
}

function delete_pod() {
	kubectl delete pod $VAR_POD_NAME
}

function logs_from_pod() {
	kubectl logs $VAR_POD_NAME > ~/Desktop/logs.txt
}

function logs_from_pod_display_only() {
	kubectl logs $VAR_POD_NAME
}
