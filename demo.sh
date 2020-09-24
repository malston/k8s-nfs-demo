#!/usr/bin/env bash

kubectl create -f nfs-client-sc.yml
kubectl get sc

kubectl create -f nfs-client-pv-4.yml
kubectl get pv

kubectl create -f nfs-client-pvc.yml
kubectl get pvc

kubectl create -f nfs-client-pod-1.yml
kubectl get pod
kubectl get pod nfs-client-pod-1 -o yaml

kubectl describe pod nfs-client-pod-1

kubectl exec -it nfs-client-pod-1 /bin/sh
cd /mnt
touch blah.txt

kubectl delete -f nfs-client-pod-1.yml
kubectl delete -f nfs-client-pvc.yml
kubectl delete -f nfs-client-pv-4.yml
