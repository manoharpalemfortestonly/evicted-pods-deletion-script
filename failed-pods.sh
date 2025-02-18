#!/bin/bash

apt update -y
apt upgrade -y
apt install curl -y

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin

# All workload objects to search for
OBJECTS=pods
NAMESPACES=awx

# Output files for the grep later on
NS_WL=failed-pods.txt

# Get list of all evicted pods and delete
kubectl get pod -n awx | grep Failed | awk '{print $1}' | xargs kubectl delete pod -n awx > ${NS_WL}

# Display deleted pods from log file

if [ -s ${NS_WL} ] ; then
    echo "failed pods deleted"
else
    echo "no such failed pods exists"
fi