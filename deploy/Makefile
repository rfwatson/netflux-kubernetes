.PHONY: dev prod prod-ovh cert-manager tailscale-operator inflate

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	# go install https://git.netflux.io/rob/envfilesubst@latest
	@kubectl kustomize --enable-helm prod | envfilesubst -f prod/secrets/env

prod-ovh: load-prod-ovh-env
	# go install https://git.netflux.io/rob/envfilesubst@latest
	@kubectl kustomize --enable-helm prod-ovh | envfilesubst -f prod-ovh/secrets/env

cert-manager:
	@kubectl kustomize --enable-helm cert-manager

tailscale-operator:
	@kubectl kustomize --enable-helm tailscale-operator

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)

load-prod-ovh-env:
	$(eval include prod-ovh/secrets/env)
	$(eval export)

# Usage: make inflate name=prometheus chart=prometheus-community/prometheus [base=dev]
base=base
namespace=default
inflate:
	@bin/helm-chart-inflate.sh $(name) $(chart) $(base) $(namespace)
