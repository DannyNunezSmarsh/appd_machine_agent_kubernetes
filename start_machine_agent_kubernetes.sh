KUBE_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
curl -sS --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt  -H "Authorization: Bearer $KUBE_TOKEN"       https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods/$HOSTNAME | grep nodeName | awk -F\" '{print $4}'
