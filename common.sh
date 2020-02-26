#!/bin/bash

# OPTIONS:
# w - will wait in the end
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
	
if [[ $VAR_W_OPTION == 1 ]]; then
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

	phase "pod name = '$VAR_POD_NAME'"
}

function open_bash_to_pod() {
	winpty kubectl exec -it $VAR_POD_NAME bash
}

function open_sh_to_pod() {
	winpty kubectl exec -it $VAR_POD_NAME sh
}

# params: 1 porting (e.g. 8080:8080)
function port_forward_from_pod() {
	kubectl port-forward $VAR_POD_NAME $1
}

function delete_pod() {
	kubectl delete pod $VAR_POD_NAME
}

function download_logs_from_pod() {

  phase "downloading logs"

	mkdir -p ~/Desktop/temp
	rm -f ~/Desktop/temp/text.txt
	echo "n/a" > ~/Desktop/temp/text.txt

	kubectl logs $VAR_POD_NAME > ~/Desktop/temp/text.txt

	phase "logs downloaded"
}

# params: 1 pod name, 2 absolute file path
function download_text_file_from_pod() {

  phase "downloading text file"

	mkdir -p ~/Desktop/temp
	rm -f ~/Desktop/temp/text.txt
	rm -f ~/Desktop/temp/temp.txt
	echo "n/a" > ~/Desktop/temp/text.txt

	cd ~/Desktop/
	kubectl cp $1:$2 ./temp/temp.txt

  if [ -f "temp/temp.txt" ]; then
      cat temp/temp.txt > temp/text.txt
	  rm -f ~/Desktop/temp/temp.txt
  fi

  phase "text file downloaded"
}

function show_logs_from_pod() {

  phase "showing logs"

	kubectl logs $VAR_POD_NAME
}
