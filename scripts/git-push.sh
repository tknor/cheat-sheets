#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

phase "cheat-sheets"

if [[ -v ffc ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

phase "jvm-lab"

if [[ -v ffjl ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

phase "nodejs-lab"

if [[ -v ffnl ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

phase "spring-lab"

if [[ -v ffsl ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

phase "aranea (spring)"

if [[ -v ffara ]]; then
    $ffs/./git-push-specific.sh $ffara
fi

phase "ankylos (angular)"

if [[ -v ffank ]]; then
    $ffs/./git-push-specific.sh $ffank
fi

phase "nok"

if [[ -v ffnok ]]; then
    $ffs/./git-push-specific.sh $ffnok
fi
