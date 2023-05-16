https://strimzi.io/blog/2018/11/01/using-helm/
helm repo add strimzi https://strimzi.io/charts/
helm install fsm-akka-strimzi strimzi/strimzi-kafka-operator --namespace strimzi-operator --create-namespace --set watchAnyNamespace=true
helm install fsm-akka-strimzi strimzi/strimzi-kafka-operator --namespace fsm-akka-infrastructure --create-namespace
kubectl create -f 'https://strimzi.io/install/latest?namespace=fsm-akka-infrastructure' -n fsm-akka-infrastructure

https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html
helm repo add elastic https://helm.elastic.co
helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace

https://docs-v2.k8ssandra.io/install/local/single-cluster-helm/
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
helm install k8ssandra-operator k8ssandra/k8ssandra-operator -n k8ssandra-operator --create-namespace --set global.clusterScoped=true

helm upgrade fsm-akka-infrastructure . -n fsm-akka-infrastructure --install -f values-dev.yaml -f values-kafka.yaml --create-namespace --dry-run