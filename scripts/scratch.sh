#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

VAR_A=10
VAR_R=$(($VAR_A - 1))

VAR_TEXT="uh-oh"

VAR_TEXT_MOD="$VAR_TEXT-opt"

echo $VAR_TEXT_MOD
