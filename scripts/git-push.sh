#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

function announce() {
  phase "----------------| $1"
}

announce "cheat-sheets"

if [[ -v ffc ]]; then
    $ffs/./git-push-specific.sh $ffc
fi

announce "jvm-lab"

if [[ -v ffjl ]]; then
    $ffs/./git-push-specific.sh $ffjl
fi

announce "nodejs-lab"

if [[ -v ffnl ]]; then
    $ffs/./git-push-specific.sh $ffnl
fi

announce "spring-lab"

if [[ -v ffsl ]]; then
    $ffs/./git-push-specific.sh $ffsl
fi

announce "aranea (spring)"

if [[ -v ffara ]]; then
    $ffs/./git-push-specific.sh $ffara
fi

announce "ankylos (angular)"

if [[ -v ffank ]]; then
    $ffs/./git-push-specific.sh $ffank
fi

announce "nok"

if [[ -v ffnok ]]; then
    $ffs/./git-push-specific.sh $ffnok
fi
