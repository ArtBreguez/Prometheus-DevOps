# Prometheus, Grafana and Node Exporter

## Run on the server that will run the App

```
docker run \
    -d \
    --restart=unless-stopped \
    --name node-exporter \
    -p 9100:9100 \
    bitnami/node-exporter:latest
```
### Get PID usage
Change the process name for your app on test.sh and run:
```
while sleep 1; do ./test.sh; done;
```
## Run on the grafana server
```
docker compose up -d
```
## Grafana Queries

### Server View
CPU Usage:
```
100 * avg by (mode, instance) (rate(node_cpu_seconds_total{mode!="idle"}[1m]))
```
Memory Usage:
```
1e-9 * (node_memory_MemTotal_bytes - (node_memory_MemFree_bytes + node_memory_Cached_bytes + node_memory_Buffers_bytes))
```
### PID View
```
cpu_usage{pid="x"}
```
```
memory_usage{pid="x"}
```
