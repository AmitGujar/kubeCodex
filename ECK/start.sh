#!/bin/bash

init_crds() {
    echo "setting up the crds for elastic search...."
    kubectl create -f https://download.elastic.co/downloads/eck/2.12.1/crds.yaml
    kubectl apply -f https://download.elastic.co/downloads/eck/2.12.1/operator.yaml
}

deployment() {
    kubectl apply -f deployment.yml
    kubectl apply -f kibana.yml
}

kubectl get nodes
if [ $? -ne 0 ]; then
    echo "cluster is in failed state....."
    exit 1
else
    init_crds
    deployment
fi
