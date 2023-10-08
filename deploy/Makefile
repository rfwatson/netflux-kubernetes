.PHONY: dev prod inflate lint

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	# go install https://git.netflux.io/rob/envfilesubst@latest
	@kubectl kustomize --enable-helm prod | envfilesubst -f prod/secrets/env

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)

# Usage: make inflate name=prometheus chart=prometheus-community/prometheus [base=dev]
base=base
inflate:
	@bin/helm-chart-inflate.sh $(name) $(chart) $(base)
