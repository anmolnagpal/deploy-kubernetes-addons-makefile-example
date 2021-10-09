include common.mk
include env.$(ENVIRONMENT).mk

.DEFAULT_GOAL := help

.PHONY: all
all: deploy-all

.PHONY: deploy-all
deploy-all: $(foreach app,$(APPS),deploy-$(app)) ## Deploy all application to a given environment

.PHONY: deploy-%
deploy-%: ## Deploy a single application to a given environment
	$(MAKE) -C $* -e ENVIRONMENT=$(ENVIRONMENT) deploy

.PHONY: destroy-all
destroy-all: $(foreach app,$(APPS),destroy-$(app)) ## Destroy all application to a given environment

.PHONY: destroy-%
destroy-%: ## Destroy a single application to a given environment
	$(MAKE) -C $* -e ENVIRONMENT=$(ENVIRONMENT) destroy

.PHONY: help
help: ## Display this help. Thanks to https://suva.sh/posts/well-documented-makefiles/
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
