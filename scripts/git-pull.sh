#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if ! [[ -z "$ffc" ]]; then
    cd $ffc
    git pull
fi

phase "jvm-lab"

if ! [[ -z "$ffjl" ]]; then
    cd $ffjl
    git pull
fi

phase "nodejs-lab"

if ! [[ -z "$ffnl" ]]; then
    cd $ffnl
    git pull
fi

phase "spring-lab"

if ! [[ -z "$ffsl" ]]; then
    cd $ffsl
    git pull
fi

phase "ConBank"

if ! [[ -z "$ffcb" ]]; then
    cd $ffcb
    git pull
fi

phase "ConBankUI"

if ! [[ -z "$ffcbu" ]]; then
    cd $ffcbu
    git pull
fi

phase "undead"

if ! [[ -z "$ffud" ]]; then
    cd $ffud
    git pull
fi
