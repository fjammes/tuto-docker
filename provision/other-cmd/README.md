`
sudo kubeadm init

# Then join other nodes...

kubectl get pods

# Config
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown qserv $HOME/.kube/config

# Network: Firt try without
kubectl apply -f https://git.io/weave-kube-1.6

# Seems to be usefull??
kubectl run --image=weaveworks/hello-world hello

# Fichier
curl -O https://raw.githubusercontent.com/kubernetes/kubernetes.github.io/master/docs/user-guide/walkthrough/pod-nginx.yaml

# Create pod
kubectl create -f pod-nginx.yaml

kubectl get pods

kubectl run busybox --image=busybox --restart=Never --tty -i --generator=run-pod/v1 --env "POD_IP=$(kubectl get pod nginx -o go-template='{{.status.podIP}}')"

# Redis
curl -O https://raw.githubusercontent.com/kubernetes/kubernetes.github.io/master/docs/user-guide/walkthrough/pod-redis.yaml
kubectl create -f pod-redis.yaml
kubectl exec -it redis bash
`


