.PHONY: lint

lint:
	go run golang.stackrox.io/kube-linter/cmd/kube-linter@latest lint .
