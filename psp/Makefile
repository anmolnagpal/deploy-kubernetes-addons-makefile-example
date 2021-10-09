include ../env.$(ENVIRONMENT).mk
include ../common.mk

.PHONY: deploy
deploy:
	kubectl apply -f ./common -f ./$(ENVIRONMENT)

.PHONY: destroy
destroy:
	kubectl delete -f ./common -f ./$(ENVIRONMENT)