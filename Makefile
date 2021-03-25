EKS_CONFIG:=cluster.yaml

default: help

.PHONY: spin-up
spin-up: ## create the eks cluster with all the required services in it
	eksctl create cluster -f $(EKS_CONFIG)

.PHONY: spin-down
spin-down: ## delete the eks cluster with all the services in it
	eksctl delete cluster -f $(EKS_CONFIG)

.SILENT: help
help:   ## print this help
	echo '** Make targets **'
	grep '^[a-zA-Z]' $(MAKEFILE_LIST) | \
    sort | \
    awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'
