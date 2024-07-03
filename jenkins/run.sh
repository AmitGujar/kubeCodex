#!/bin/bash

helm uninstall jenkins

helm upgrade --install jenkins jenkinsci/jenkins --values values.yml
