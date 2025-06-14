package holos

import "encoding/yaml"

Component: KustomizeConfig: Kustomization: {
	_patches: limits: {
		target: kind: "Deployment"
		patch: yaml.Marshal([{
			op:    "test"
			path:  "/spec/template/spec/containers/0/resources/limits"
			value: null
		}, {
			op:   "replace"
			path: "/spec/template/spec/containers/0/resources/limits"
			value: {}
		}])
	}
	patches: [for x in _patches {x}]
}