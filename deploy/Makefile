.PHONY: dev prod inflate

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	@kubectl kustomize --enable-helm prod | envsubst

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)

# Usage: make inflate name=prometheus chart=prometheus-community/prometheus
inflate:
	@rm -rf -- base/inflated/$(name)
	@helm template $(name) $(chart) --output-dir base/inflated
	@echo "YAML files for kustomzation.yaml:"
	@find base/inflated/$(name) -iname '*.yaml' -exec realpath --relative-to base {} \;
