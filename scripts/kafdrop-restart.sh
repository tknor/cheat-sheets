#!/bin/bash

. ~/Workspaces/Git/cheat-sheets/scripts/local/local.sh

script_start

stop_docker_container "kafdrop"

phase "starting kafdrop"

docker run -d --rm -p 9000:9000 -e JVM_OPTS="-Xms32M -Xmx64M" -e SERVER_SERVLET_CONTEXTPATH="/" --name kafdrop obsidiandynamics/kafdrop
# -e KAFKA_BROKERCONNECT=<host:port,host:port>
