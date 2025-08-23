#!/bin/bash

# All workload objects to search for
OBJECTS=pods
NAMESPACES=awx

# Output files for the grep later on
NS_WL=evicted-pods.txt

# Get list of all evicted pods and delete
kubectl get pod -n awx | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n awx > ${NS_WL}

# Display deleted pods from log file 

if [ -s ${NS_WL} ] ; then
    echo "evicted pods deleted"
else
    echo "no such evicted pods exists"
fi







