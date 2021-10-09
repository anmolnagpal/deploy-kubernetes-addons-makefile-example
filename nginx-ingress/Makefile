
.PHONY: deploy
deploy:
	kubectl apply -f ./common.yaml -f ./$(ENVIRONMENT).yaml

.PHONY: destroy
destroy:
	kubectl delete -f ./common.yaml -f ./$(ENVIRONMENT).yaml