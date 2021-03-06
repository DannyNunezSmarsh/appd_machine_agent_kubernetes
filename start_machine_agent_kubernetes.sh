#!/bin/bash
KUBE_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
echo $KUBE_TOKEN
echo $KUBERNETES_SERVICE_HOST
echo $KUBERNETES_PORT_443_TCP_PORT
echo $HOSTNAME
echo `curl -sS --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt  -H "Authorization: Bearer $KUBE_TOKEN"       https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods/$HOSTNAME`
APPDYNAMICS_AGENT_UNIQUE_HOST_ID=$(curl -sS --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt  -H "Authorization: Bearer $KUBE_TOKEN"       https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods/$HOSTNAME | grep nodeName | awk -F\" '{print $4}')
echo "Unique Host ID should be: $APPDYNAMICS_AGENT_UNIQUE_HOST_ID"
echo "Hostname is $HOSTNAME"
cd /appd_machine_agent

java -Dappdynamics.agent.uniqueHostId=$APPDYNAMICS_AGENT_UNIQUE_HOST_ID -jar machineagent.jar
