.PHONY: dev prod

dev:
	@kubectl kustomize --enable-helm dev

prod: load-prod-env
	@kubectl kustomize --enable-helm prod | envsubst

load-prod-env:
	$(eval include prod/secrets/env)
	$(eval export)
