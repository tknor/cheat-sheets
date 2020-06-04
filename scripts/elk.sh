#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

  if [[ $1 == "u" ]]; then

    phase "starting ELK stack"
    docker-compose -f $ffs/docker-compose/elk.yml up -d

    docker exec logstash mkdir -p scripts

  elif [[ $1 == "d" ]]; then

    phase "stopping ELK stack"
    docker-compose -f $ffs/docker-compose/elk.yml down

  elif [[ $1 == "lsh" ]]; then

    phase "connecting to logstash"
    winpty docker exec -it logstash sh

  elif [[ $1 == "esh" ]]; then

    phase "connecting to elastic"
    winpty docker exec -it elastic sh

  elif [[ $1 == "r" ]]; then

    phase "copying logstash configuration"
    sed -i 's/\r//' $CONST_SCRIPTS_LOCAL_FOLDER/logstash/logstash.conf
    docker cp $CONST_SCRIPTS_LOCAL_FOLDER/logstash/logstash.conf logstash:/usr/share/logstash/scripts/logstash.conf

    phase "running logstash configuration"
    docker exec logstash logstash -f scripts/logstash.conf --path.data /usr/share/logstash/garmin-data --debug
#    docker exec logstash logstash -f scripts/logstash.conf --path.data /usr/share/logstash/garmin-data

  else
    phase "what with it?"
    exit 1
  fi
