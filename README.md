# Netflux on Kubernetes

This is a learning project to migrate the self-hosted services that I host at
netflux.io to Kubernetes.

![Me deploying my blog on Kubernetes](https://git.netflux.io/rob/netflux-kubernetes/raw/branch/main/picture.jpg)

This repository contains the Kubernetes manifests, which are built using
Kustomize. Helm chart dependencies are inflated and managed in this repository
to improve observability. The cluster is deployed to DigitalOcean managed K8S
in production, but can be easily applied to a local cluster for testing.

## Building

The manifests can be built with:

```
make dev
```

and applied with:

```
make dev | kubectl apply -f -
```

## Helm charts

When required, helm charts can be inflated with:

```
# install or update the prometheus helm chart:
make inflate name=prometheus chart=prometheus-community/prometheus
```

An optional values file can be provided in `deploy/base/values/prometheus.yaml` (update the helm chart name accordingly).

## Cluster setup

### cert-manager

cert-manager should only be installed in production. It is not managed inside this repository.

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
