# Netflux on Kubernetes

This repo contains Kubernetes manifests for deploying various self-hosted
services to the `netflux.io` domain.

![Me deploying my blog on Kubernetes. Credit @dexhorthy](https://git.netflux.io/rob/netflux-kubernetes/raw/branch/main/picture.jpg)

All of the manifests are built using [Kustomize](https://kustomize.io/). I
avoid Helm charts whenever possible, but when they're needed (Prometheus,
Grafana, etc) the charts are inflated into this repository for visibility and
auditability.

The manifests are deployed to a DigitalOcean managed k8s cluster in production,
and can be easily applied to a local cluster for testing and development.

Of course all this would in many ways be simpler with a docker-compose.yml
shipped to a virtual host, which is exactly how everything used to be deployed.
This project is mostly a fun learning exercise.

## Git

The main git repo is hosted at: https://git.netflux.io/rob/netflux-kubernetes

It is also mirrored on GitHub: https://github.com/rfwatson/netflux-kubernetes

## Building

The manifests can be built with:

```
make dev
```

and applied with:

```
make dev | kubectl apply -f -
```

## Linting

The manifests are linted with [kube-linter](https://docs.kubelinter.io):

```
kube-linter lint .
```

## Helm charts

When required, Helm charts can be inflated with:

```
# install or update the prometheus helm chart:
make inflate name=prometheus chart=prometheus-community/prometheus
```

An optional values file can be provided, e.g. `deploy/base/values/prometheus.yaml`.

## URLs

URLs to some of the deployed services:

* [git.netflux.io](https://git.netflux.io)
* [tube.netflux.io](https://tube.netflux.io)
* [element.netflux.io](https://element.netflux.io)

## Cluster setup

### Development

To initialize the local PostgreSQL database:

```
# Ensure PostgreSQL helm chart is installed (only used in development env):
cd deploy
make dev | k apply -l app.kubernetes.io/name=postgresql -f -

kubectl port-forward dev-postgresql-0 5432
psql -h localhost -f ../kind/bin/setup-dev-db.sql
```

To connect locally to the Nginx ingress controller:

```
sudo -E kubectl port-forward dev-ingress-nginx-controller-abcdef1234-ab123 80:80 443:443 22:22
```

### Additional dependencies

- envfilesubst [link](https://git.netflux.io/rob/envfilesubst)
