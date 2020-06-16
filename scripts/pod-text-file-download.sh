#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

ku_switch_and_set_pod_and_porting $1 $2

download_text_file_from_pod $VAR_POD /usr/share/logstash/scripts/optimize.conf
