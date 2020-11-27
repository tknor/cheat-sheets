#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

  if [[ $1 == "u" ]]; then
    header2 "starting ELK stack"
    docker-compose -f $ffs/docker-compose/elk.yml up -d

    docker exec logstash mkdir -p scripts

  elif [[ $1 == "d" ]]; then
    header2 "stopping ELK stack"
    docker-compose -f $ffs/docker-compose/elk.yml down

  elif [[ $1 == "lsh" ]]; then
    header2 "connecting to logstash"
    winpty docker exec -it logstash sh

  elif [[ $1 == "esh" ]]; then
    header2 "connecting to elastic"
    winpty docker exec -it elastic sh

  elif [[ $1 == "r" ]]; then

    header2 "copying logstash configuration"
    sed -i 's/\r//' $CONST_SCRIPTS_LOCAL_FOLDER/logstash/logstash.conf
    docker cp $CONST_SCRIPTS_LOCAL_FOLDER/logstash/logstash.conf logstash:/usr/share/logstash/scripts/logstash.conf

    header2 "running logstash configuration"
    docker exec logstash logstash -f scripts/logstash.conf --path.data /usr/share/logstash/garmin-data --debug
#    docker exec logstash logstash -f scripts/logstash.conf --path.data /usr/share/logstash/garmin-data

  else
    header2 "what with it?"
    exit 1
  fi
