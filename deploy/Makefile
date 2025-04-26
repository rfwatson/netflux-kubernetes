.PHONY: dev prod prod-ovh inflate

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	# go install https://git.netflux.io/rob/envfilesubst@latest
	@kubectl kustomize --enable-helm prod | envfilesubst -f prod/secrets/env

prod-ovh:
	# go install https://git.netflux.io/rob/envfilesubst@latest
	@kubectl kustomize --enable-helm prod-ovh

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)

# Usage: make inflate name=prometheus chart=prometheus-community/prometheus [base=dev]
base=base
namespace=default
inflate:
	@bin/helm-chart-inflate.sh $(name) $(chart) $(base) $(namespace)
