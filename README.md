# Netflux on Kubernetes

## Installation

### cert-manager

cert-manager should only be installed in production. It cannot be installed as a subchart.

See: https://cert-manager.io/docs/installation/helm/

```
helm repo add jetstack https://charts.jetstack.io
helm repo up
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.8.0 --set installCRDs=true

# create issuers
kubectl apply -f cert-manager/issuer-staging.yml
kubectl apply -f cert-manager/issuer-production.yml
```

This should be sufficient for cert-manager to issue certificates automatically when the
`tls.enabled` value is set to `true`.
