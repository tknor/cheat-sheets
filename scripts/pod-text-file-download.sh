#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

VAR_FILE_PATH="/usr/share/logstash/scripts/optimize.conf"

ku_switch_and_set_pod_and_porting $1 $2

download_text_file_from_pod $VAR_POD $VAR_FILE_PATH
