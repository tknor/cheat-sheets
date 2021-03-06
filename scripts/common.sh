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

  shift $((OPTIND - 1))

  set -e
  set -u

	if [[ $VAR_X_OPTION == 1 ]]; then
		set -x
	fi

	trap script_end EXIT

# -------------------
# common functions
# -------------------

function header1() {
  printf "\n -----------------------| %s\n\n" "$1"
}

function header2() {
	printf "\n -> %s\n\n" "$1"
}

function timestamp() {
  printf '%(%Y%m%d-%H%M%S)T' -1
}

function script_end {

  if [[ $VAR_W_OPTION == 1 ]]; then
    header2 "press any key to continue"
    read -n 1 -s -r
  fi
}

# params:
# 1 container
function stop_docker_container() {

	header2 "stopping container '$1'"

	TEMP=$(docker container ls -aqf "name=^$1$")
	if [[ $TEMP ]]; then
		docker stop $TEMP
	fi

	header2 "container stopped"
}

function stop_and_remove_docker_containers() {

	header2 "stopping and removing all containers"

	TEMP=$(docker container ls -aq)
	if [[ $TEMP ]]; then
		docker container rm -f $TEMP
	fi

	header2 "all containers removed"
}

# params:
# 1 image
function remove_docker_image() {

	header2 "removing image '$1'"

	TEMP=$(docker image ls $1 | wc -l)
	if [[ $TEMP == 2 ]]; then
		docker image rm $1
	fi

	header2 "image removed"
}

# params:
# 1 pod name part
# result in TEMP
function pod_name_from_name_part() {
	kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1
}

# params:
# 1 kubectl context
function ku_switch() {
  kubectl config use-context $1
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
# 2 archived log name
function download_logs_from_pod() {

  header2 "downloading logs"

  VAR_TIMESTAMP=$(timestamp)

  VAR_PRIMARY_FILE=$CONST_TEMP_FOLDER/text.txt
  if [[ $# -eq 2 ]]; then
    VAR_ALTERNATIVE_FILE=$CONST_TEMP_FOLDER/log-$2-$VAR_TIMESTAMP.txt
  else
    VAR_ALTERNATIVE_FILE=$CONST_TEMP_FOLDER/log-$VAR_TIMESTAMP.txt
  fi

	mkdir -p $CONST_TEMP_FOLDER
	rm -f $VAR_PRIMARY_FILE
	echo "n/a" > $VAR_PRIMARY_FILE

	kubectl logs $1 | tee $VAR_PRIMARY_FILE $VAR_ALTERNATIVE_FILE > /dev/null

	header2 "logs downloaded"
}

# params:
# 1 pod name
# 2 absolute file path
function download_text_file_from_pod() {

  header2 "downloading text file"

	mkdir -p $CONST_TEMP_FOLDER
	rm -f $CONST_TEMP_FOLDER/text.txt
	rm -f $CONST_TEMP_FOLDER/temp.txt
	echo "n/a" > $CONST_TEMP_FOLDER/text.txt

  cd $CONST_TEMP_FOLDER
	kubectl cp $1:$2 temp.txt

  if [[ -f "$CONST_TEMP_FOLDER/temp.txt" ]]; then
      cat $CONST_TEMP_FOLDER/temp.txt > $CONST_TEMP_FOLDER/text.txt
	  rm -f $CONST_TEMP_FOLDER/temp.txt
  fi

  header2 "text file downloaded"
}

# params:
# 1 pod
function show_logs_from_pod() {

  header2 "showing logs"

	kubectl logs $1
}

