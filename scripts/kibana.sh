#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

if [[ $1 == "u" ]]; then
  stop_docker_container "kibana-standalone"
  header2 "starting kibana-standalone"

  docker run -p "5601:5601" -e "ELASTICSEARCH_HOSTS=http://localhost:9200" --rm -d --name kibana-standalone docker.elastic.co/kibana/kibana-oss:7.8.0

elif [[ $1 == "d" ]]; then
  stop_docker_container "kibana-standalone"

else
  header2 "what with it?"
  exit 1
fi