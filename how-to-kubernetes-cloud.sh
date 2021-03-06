#!/bin/bash

# How to setup Kubernetes in the cloud

# Google Container Engine GCE
gcloud container clusters get-credentials example-voting-app --zone us-west2-a --project temporal-falcon-143923
kubectl get nodes
kubectl get pods
kubectl get services
