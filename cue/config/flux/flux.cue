package flux

#FluxConfig: {
    namespace: string
}

// TODO: syntax server
config: #FluxConfig & {
    namespace: "flux-system"
}