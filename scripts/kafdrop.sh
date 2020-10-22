#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local-common.sh

if [[ $1 == "u" ]]; then
  stop_docker_container "kafdrop"
  phase "starting kafdrop"

  docker run -d --rm -p 9000:9000 -e JVM_OPTS="-Xms32M -Xmx64M" -e SERVER_SERVLET_CONTEXTPATH="/" --name kafdrop obsidiandynamics/kafdrop
  # -e KAFKA_BROKERCONNECT=<host:port,host:port>

elif [[ $1 == "d" ]]; then
  stop_docker_container "kafdrop"

else
  phase "what with it?"
  exit 1
fi