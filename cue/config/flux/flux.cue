package flux

#FluxConfig: {
    config: {
        namespace: string
    }
}

// TODO: syntax server
flux: #FluxConfig & {
    config: {
	    namespace: "flux-system"
    }
}