#!/bin/bash

helm repo add grafana https://grafana.github.io/helm-charts
echo "adding grafana helm repository"

helm repo update

helm upgrade --install loki grafana/loki-stack --values values.yml -n loki --create-namespace

#forward the port

#kubectl port-forward pod/loki-grafana-pod -n loki 9090:3000

#kubectl get secret --namespace grafana-loki loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
