# Applications to deploy, order is important
APPS = \
	namespaces \
	limit-ranges \
	nginx-ingress \
	external-dns \
	psp \
	rbac

# Ref: https://github.com/helm/charts/blob/master/stable/external-dns
EXTERNAL_DNS_CHART_VERSION = 2.6.4
