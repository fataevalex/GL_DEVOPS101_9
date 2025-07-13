#!/bin/bash
kubectl delete secret generic kube2iam-aws-credentials --namespace flux-system

kubectl create secret generic kube2iam-aws-credentials \
  --namespace flux-system \
  --from-literal=AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --from-literal=AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  --from-literal=="${AWS_DEFAULT_REGION}"

kubectl describe secret generic kube2iam-aws-credentials --namespace flux-system