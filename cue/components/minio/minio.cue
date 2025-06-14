package holos

// import "holos.example/config/flux"

holos: Helm.BuildPlan

Helm: #Helm & {
	// Namespace: flux.config.Namespace
	Namespace: "test"
	Chart: {
		name:    "minio-operator"
		version: "5.0.18"
		repository: {
			name: "minio-operator"
			url:  "https://operator.min.io"
		}
	}
}