.PHONY: dev prod inflate

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	@kubectl kustomize --enable-helm prod | envsubst

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)

# Usage: make inflate name=prometheus chart=prometheus-community/prometheus [base=dev]
base=base
inflate:
	@bin/helm-chart-inflate.sh $(name) $(chart) $(base)
