#!/bin/bash
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

helm upgrade --install jenkins jenkinsci/jenkins --values values.yml
