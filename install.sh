#!/usr/bin/env bash

NAMESPACE=argo-cd
ARGOCD_RELEASE=argo-cd
ROOT_RELEASE=root

helm upgrade --install $ARGOCD_RELEASE argo-cd --create-namespace --namespace $NAMESPACE --repo https://argoproj.github.io/argo-helm

kubectl delete secret sh.helm.release.v1.$ARGOCD_RELEASE.v1 --namespace $NAMESPACE

helm upgrade --install $ROOT_RELEASE ./charts/root -n $NAMESPACE --repo https://argoproj.github.io/argo-helm

