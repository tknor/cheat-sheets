#!/bin/bash

# shellcheck source=./local-common.sh
. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

  if [[ $1 == "dist" ]]; then
    phase "distribution of nodejs-lab/util"
    cp -r $ffnl/src/util $ffnok/src

  elif [[ $1 == "rnd" ]]; then
    phase "running notok in development mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js dev

  elif [[ $1 == "rnt" ]]; then
    phase "running notok in token mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js token

  elif [[ $1 == "rnp" ]]; then
    phase "running notok in production mode"
    cd $ffnok
    tsc
    node compiled/notok/main.js

  elif [[ $1 == "rns" ]]; then
    phase "running notok/scratch.ts"
    cd $ffnok
    tsc
    node compiled/notok/scratch.js

  elif [[ $1 == "rls" ]]; then
    phase "running nodejs-lab/scratch.ts"
    cd $ffnl
    tsc
    node compiled/scratch.js

  elif [[ $1 == "deploy" ]]; then
    phase "deploying nok to VPS"
    phase "NOT IMPLEMENTED"

  else
    phase "what with it?"
    exit 1
  fi
