include ../env.$(ENVIRONMENT).mk
include ../common.mk

# pull secret from Azure Keyvault
ASSUME_ROLE_ARN = $(shell $(SECRET_SHOW) assume-role-arn)
ZONE_TYPE = $(shell $(SECRET_SHOW) zone-type)
REGION = $(shell $(SECRET_SHOW) region)

# check for mandatory values, if not defined or something happen while pulling
# it should fail
ifeq ($(ASSUME_ROLE_ARN),)
  $(error CLOUDFLARE_EMAIL is not defined)
endif

ifeq ($(ZONE_TYPE),)
  $(error CLOUDFLARE_API_KEY is not defined)
endif

ifeq ($(REGION),)
  $(error CLOUDFLARE_API_KEY is not defined)
endif

.PHONY: deploy
deploy:
	@helm upgrade \
		--version $(EXTERNAL_DNS_CHART_VERSION) \
		--namespace kube-system \
		-i external-dns \
		-f ./values.common.yaml \
		-f ./values.$(ENVIRONMENT).yaml \
		--set aws.assumeRoleArn=$(ASSUME_ROLE_ARN) \
		--set aws.zoneType=$(ZONE_TYPE) \
		--set aws.region=$(REGION) \
		bitnami/external-dns
