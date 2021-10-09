include ../env.$(ENVIRONMENT).mk
include ../common.mk

.PHONY: deploy
deploy:
	kubectl apply -f ./$(ENVIRONMENT).yaml

.PHONY: destroy
destroy:
	kubectl delete -f ./$(ENVIRONMENT).yaml
