#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

stop_docker_container "kibana-standalone"

phase "starting kibana-standalone"

docker run -p "5601:5601" -e "ELASTICSEARCH_HOSTS=http://localhost:9200" --rm -d --name kibana-standalone docker.elastic.co/kibana/kibana-oss:7.2.1
