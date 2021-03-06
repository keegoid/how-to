#!/bin/bash

# Kubernetes Master node has kube-apiserver which communicates with kubelet
# agent running on worker node
# Worker node runs docker container on top of container runtime
# all values are stored in a key-value store "etcd framework" on the Master
# Master also has the controller and scheduler
kubectl run hello-minikube # deploy application on cluster
kubectl cluster-info # view information about the cluster
kubectl get nodes # list all nodes in cluster

# Minikube is a tool to setup Kubernetes in an all-in-one system
# Kubeadm is a tool used to setup Kubernetes in a multi-node setup on local machine
# GCP and AWS can also be used to host Kubernetes
# play-with-k8s.com can setup a Kubernetes cluster instantly

# ------------------------------------------- minikube

minikube start --vm-driver=virtualbox
kubectl get nodes
# NAME       STATUS   ROLES    AGE     VERSION
# minikube   Ready    master   3m56s   v1.17.0

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
# deployment.apps/hello-minikube created

kubectl expose deployment hello-minikube --type=NodePort --port=8080
# service/hello-minikube exposed

kubectl get pods
# NAME                              READY   STATUS    RESTARTS   AGE
# hello-minikube-797f975945-6vghd   1/1     Running   0          74s

minikube service hello-minikube --url
kubectl delete services hello-minikube
kubectl delete deployment hello-minikube
minikube stop
minikube delete

# ------------------------------------------- kubeadm

# setup virtualbox images: apt upgrade, ssh, vim-gtk, dhcp netplan, hostname, docker-ce

sudo swapoff -av
sudo vi /etc/fstab # commend out swap partition
sudo shutdown -r now

# add kubernetes repository
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# configure docker systemd service
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
sudo mkdir -p /etc/systemd/system/docker.service.d

# restart docker
sudo systemctl daemon-reload
sudo systemctl restart docker

# init kubeadm master with pod network add-on Flannel to listen on its IP address
sudo swapoff -av
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=10.99.101.249

# allow non-root user to execute kube* commands
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# apply the flannel add-on to create the pods
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
kubectl get pods --all-namespaces

# run on nodes to join them to master
sudo swapoff -av
sudo kubeadm join 10.99.101.249:6443 --token izczjg.m5od6xh7u2ialpwv --discovery-token-ca-cert-hash sha256:5a6655df1020e69475b69cad9a0d35c190b1643f7ba18e1e6189f971353efe35

# create nginx pod and run on a node
kubectl run nginx --image=nginx

# get details of the pod
kubectl describe pods
kubectl describe pod my-pod

# get a bit more output from 'get' command
kubectl get pods -o wide

# Kubernetes YAML files must include
# pod-definition.yml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
    - name: nginx-container
      image: nginx

# create a pod
kubectl create -f pod-definition.yml