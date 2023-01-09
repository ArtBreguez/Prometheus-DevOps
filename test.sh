#!/bin/bash
#busca metricas de um processo e envia para endpoint do pushgateway
var=$(top -bn1 | grep '<process_name>' | awk '{print "cpu_usage{process=\"<process_name>\"}", $9z}');
curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://192.168.1.113:9091/metrics/job/top/instance/machine
var=$(top -bn1 | grep '<process_name>' | awk '{print "memory_usage{process=\"<process_name>\"}", $10z}');
curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://192.168.1.113:9091/metrics/job/top/instance/machine
