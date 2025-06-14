package holos

import "holos.example/config/flux"

Component: {

	// Ensure resources go in the correct namespace
	// Resources: [_]: [_]: metadata: namespace: flux.config.namespace
	
	Resources: {
		Namespace: {
			Ns: {
				metadata: name: flux.config.namespace
				metadata: labels: name: flux.config.namespace
			}
		}

		FluxInstance: {
			Flux: {
			metadata: name: "flux"
			metadata: namespace: flux.config.namespace
			spec: {
				distribution: {
					version: "2.6.1"
					registry: "ghcr.io/fluxcd"
					artifact: "oci://ghcr.io/controlplaneio-fluxcd/flux-operator-manifests"
				}
				components: [
					"source-controller",
					"kustomize-controller",
					"helm-controller",
					"notification-controller",
				]
				cluster: {
					type: "kubernetes"
					multitenant: false
					networkPolicy: true
					domain: "cluster.local"
				}
			}}
		}
	}
}