#!/bin/bash

echo "creating secrets from the file......"
kubectl -n confluent create secret generic ccloud-credentials --from-file=plain.txt=ccloud-credentials.txt
kubectl -n confluent create secret generic ccloud-sr-credentials --from-file=basic.txt=ccloud-sr-credentials.txt

if [ $? -ne 0 ]; then
	echo "deleting existing secrets......."
	kubectl -n confluent delete secret ccloud-credentials
	kubectl -n confluent delete secret ccloud-sr-credentials
else
	echo "nothing to do here"
fi


