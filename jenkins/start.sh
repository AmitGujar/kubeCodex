#!/bin/bash

echo "Starting installation......."

install_jenkins() {
	kubectl apply -f rbac.yaml
	echo "update the node_name in volume.yaml file"
	sleep 10
	kubectl apply -f volume.yaml
	kubectl apply -f deployment.yaml
	kubectl apply -f service.yaml
	watch -n1 kubectl get pods
	echo "use this command to get admin password"
	echo "k exec -it <pod_name> -- cat /var/jenkins_home/secrets/initialAdminPassword"
}

kubectl get ns | grep jenkins
if [ $? -ne 0 ]; then
	echo "jenkins namespace not found"
	kline use jenkins
	install_jenkins
else
	install_jenkins
fi

