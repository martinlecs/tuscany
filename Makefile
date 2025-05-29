KUBECTL=kubecolor

CLUSTER_CONFIG_PATH:=cluster

default: start

.PHONY: require-sudo
require-sudo:
	@sudo -v

.PHONY: exit-sudo
exit-sudo:
	@sudo -k

.PHONY: setup-internal
setup-internal: 
	@bash ./hack/install-nix.sh

.PHONY: startup-check
startup-check:
	@bash ./hack/startup-check.sh

.PHONY: setup
setup: require-sudo setup-internal exit-sudo startup-check

.PHONY: start
start:
	@nix-shell --command "$$SHELL" < /dev/tty

.PHONY: create
create: caddy
	@kind create cluster --config $(CLUSTER_CONFIG_PATH)/cluster.yaml --name tuscany
	@$(KUBECTL) apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/standard-install.yaml
	@yes | helmfile init
	@CONTROL_PLANE_IP=$$( \
		docker network inspect kind \
		| jq -r '.[].Containers[] | select(.Name=="tuscany-control-plane") | .IPv4Address | split("/")[0]' \
	) \
	helmfile apply -f $(CLUSTER_CONFIG_PATH)/helmfiles/cilium.gotmpl
	@cilium status --wait
	@helmfile apply -f $(CLUSTER_CONFIG_PATH)/helmfiles/addons.yaml
	@$(KUBECTL) label node tuscany-control-plane node.kubernetes.io/exclude-from-external-load-balancers-
	@$(KUBECTL) apply -k $(CLUSTER_CONFIG_PATH)/manifests
# update caddy config based on load balancer
# https://github.com/nginx-proxy/docker-gen

.PHONY: caddy
caddy:
	@docker compose up -d
# @bash ./hack/update-certs.sh

.PHONY: check-data-plane
check-data-plane:
	@cilium connectivity test --test '!check-log-errors'

.PHONY: clean
clean:
	@kind delete cluster --name tuscany
	@docker compose down -v

.PHONY: acctests
acctests:
	@echo "implement acceptance tests"