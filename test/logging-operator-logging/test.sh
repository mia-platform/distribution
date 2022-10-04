#!/bin/bash

echo "Executing custom test.sh"
c=0
NAMESPACE=logging-system

for kindName in DaemonSet,logging-fluentbit StatefulSet,logging-fluentd; do
  while [ $c -ne 30 ]; do
    OUTPUT=$(kubectl -n ${NAMESPACE} rollout status --timeout 60s "$( tr ',' ' ' <<< ${kindName} )" 2>&1 )
    rc=$?
    if [[ ${OUTPUT} == *NotFound* ]] ; then
      echo "$( tr ',' ' ' <<< ${kindName} ) Not Found"
      sleep 2
      let c+=1
      continue
    fi
    if [ ${rc} -ne 0 ] ; then
      echo "${OUTPUT}"
      exit 128
    fi
    echo "${OUTPUT}"
    break
  done
done
