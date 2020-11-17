#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

  if [[ $1 == "dist" ]]; then
    phase "distribution of nodejs-lab/util"
    cp -r $ffnl/src/util $ffud/src

  elif [[ $1 == "rnd" ]]; then
    phase "running undead/notok/notok-dev.ts"
    cd $ffud
    tsc
    node compiled/notok/notok-dev.js

  elif [[ $1 == "rns" ]]; then
    phase "running undead/notok/notok-scratch.ts"
    cd $ffud
    tsc
    node compiled/notok/notok-scratch.js

  elif [[ $1 == "rls" ]]; then
    phase "running nodejs-lab/scratch.ts"
    cd $ffnl
    tsc
    node compiled/scratch.js

  elif [[ $1 == "deploy" ]]; then
    phase "deploying undead to VPS"
    phase "NOT IMPLEMENTED"

  else
    phase "what with it?"
    exit 1
  fi
