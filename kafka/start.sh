#!/bin/bash

getting_started() {
    echo "setting up the crds for strimzi...."
    curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.20.0/install.sh | bash -s v0.20.0
    kubectl create -f https://operatorhub.io/install/strimzi-kafka-operator.yaml
}

init_config() {
    # kline use debezium-example
    # kubectl apply -f secret.yaml
    kubectl apply -f role.yaml
    kubectl apply -f rolebinding.yaml
    kubectl apply -f deployment.yaml
}

kubectl get nodes
if [ $? -ne 0 ]; then
    echo "cluster is in failed state....."
    exit 1
else
    getting_started
    init_config
fi
