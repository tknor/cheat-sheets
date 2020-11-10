#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if ! [[ -z "$ffc" ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

phase "jvm-lab"

if ! [[ -z "$ffjl" ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

phase "nodejs-lab"

if ! [[ -z "$ffnl" ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

phase "spring-lab"

if ! [[ -z "$ffsl" ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

phase "ConBank"

if ! [[ -z "$ffcb" ]]; then
    $ffs/./git-push-specific.sh $ffcb
fi

phase "ConBankUI"

if ! [[ -z "$ffcbu" ]]; then
    $ffs/./git-push-specific.sh $ffcbu
fi

phase "undead"

if ! [[ -z "$ffud" ]]; then
    $ffs/./git-push-specific.sh $ffud
fi
