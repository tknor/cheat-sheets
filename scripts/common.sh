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

# params:
# 1 container
function stop_docker_container() {

	phase "stopping container '$1'"

	TEMP=$(docker container ls -aqf "name=^$1$")
	if [[ $TEMP ]]; then
		docker stop $TEMP
	fi

	phase "container stopped"
}

function stop_and_remove_docker_containers() {

	phase "stopping and removing all containers"

	TEMP=$(docker container ls -aq)
	if [[ $TEMP ]]; then
		docker container rm -f $TEMP
	fi

	phase "done"
}

# params:
# 1 image
function remove_docker_image() {

	phase "removing image '$1'"

	TEMP=$(docker image ls $1 | wc -l)
	if [[ $TEMP == 2 ]]; then
		docker image rm $1
	fi

	phase "done"
}

# params:
# 1 pod name part
# result in TEMP
function pod_name() {

	TEMP=$(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
	phase "pod = '$TEMP'"
}

# params:
# 1 pod
function open_bash_to_pod() {
	winpty kubectl exec -it $1 bash
}

# params:
# 1 pod
function open_sh_to_pod() {
	winpty kubectl exec -it $1 sh
}

# params:
# 1 pod
# 2 porting (e.g. 8080:8080)
function port_forward_from_pod() {
	kubectl port-forward $1 $2
}

# params:
# 1 pod
function delete_pod() {
	kubectl delete pod $1
}

# params:
# 1 pod
function download_logs_from_pod() {

  phase "downloading logs"

	mkdir -p $CONST_TEMP_FOLDER
	rm -f $CONST_TEMP_FOLDER/text.txt
	echo "n/a" > $CONST_TEMP_FOLDER/text.txt

	kubectl logs $1 > $CONST_TEMP_FOLDER/text.txt

	phase "logs downloaded"
}

# params:
# 1 pod name
# 2 absolute file path
function download_text_file_from_pod() {

  phase "downloading text file"

	mkdir -p $CONST_TEMP_FOLDER
	rm -f $CONST_TEMP_FOLDER/text.txt
	rm -f $CONST_TEMP_FOLDER/temp.txt
	echo "n/a" > $CONST_TEMP_FOLDER/text.txt

	kubectl cp $1:$2 $CONST_TEMP_FOLDER/temp.txt

  if [ -f "$CONST_TEMP_FOLDER/temp.txt" ]; then
      cat $CONST_TEMP_FOLDER/temp.txt > $CONST_TEMP_FOLDER/text.txt
	  rm -f $CONST_TEMP_FOLDER/temp.txt
  fi

  phase "text file downloaded"
}

# params:
# 1 pod
function show_logs_from_pod() {

  phase "showing logs"

	kubectl logs $1
}

