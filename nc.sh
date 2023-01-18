#!/bin/bash
for (( ; ; ))
do 
  curl -v -H "Content-Type: application/json" -X POST -s "http://172.31.24.25:3100/loki/api/v1/push" -d '{"streams": [{ "stream": { "aleno_3306_TIME-WAIT": "monitor-netstat-3306-TIME_WAIT" }, "values": [ [ "'$(date +%s%N)'", "'"$(netstat -anlp | grep :3306 | grep TIME_WAIT -wc)"'" ] ] }]}'
  curl -v -H "Content-Type: application/json" -X POST -s "http://172.31.24.25:3100/loki/api/v1/push" -d '{"streams": [{ "stream": { "aleno_3306_ESTAB": "monitor-netstat-3306-ESTAB" }, "values": [ [ "'$(date +%s%N)'", "'"$(netstat -anlp | grep :3306 | grep ESTABLISHED -wc)"'" ] ] }]}'
  curl -v -H "Content-Type: application/json" -X POST -s "http://172.31.24.25:3100/loki/api/v1/push" -d '{"streams": [{ "stream": { "aleno_netstat_all": "monitor-netstat-all" }, "values": [ [ "'$(date +%s%N)'", "'"$(netstat -anlp | grep tcp -wc)"'" ] ] }]}'
  sleep 2
done
