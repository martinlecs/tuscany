package holos

import (
	bucket "source.toolkit.fluxcd.io/bucket/v1"
	instance "fluxcd.controlplane.io/fluxinstance/v1"

	"holos.example/config/flux"
)

holos: Component.BuildPlan

// Custom resource definitions.
#Resources: {
	FluxInstance?: [_]: instance.#FluxInstance
	Bucket?: [_]: bucket.#Bucket
}

// https://github.com/controlplaneio-fluxcd/flux-operator
Component: #Helm & {
	Namespace: flux.config.namespace
	Chart: {
		name:    "oci://ghcr.io/controlplaneio-fluxcd/charts/flux-operator"
		release: "flux-operator"
		version: "0.22.0"
	}
}

