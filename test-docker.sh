#!/bin/bash
#busca metricas de um container e envia para endpoint do pushgateway
var=$(docker stats --no-stream --format "{{ json .CPUPerc }}" <container_name> | sed -r "s/\"//" | sed -r "s/%\"//" | awk '{print "cpu_usage{process=\"<container_name>\"}", $1}');
curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://192.168.1.105:9091/metrics/job/top/instance/machine
var=$(docker stats --no-stream --format "{{ json .MemPerc }}"  <container_name> | sed -r "s/\"//" | sed -r "s/%\"//" | awk '{print "memory_usage{process=\"<container_name>\"}", $1}');
curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://192.168.1.105:9091/metrics/job/top/instance/machine
