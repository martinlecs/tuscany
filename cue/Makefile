default: gen

.PHONY: gen
gen:
	holos render platform

.PHONY: debug
debug:
	cue eval $(FILE)
# cue vet -c $(FILE)

.PHONY: cue-export
cue-export:
	cue export $(FILE) --out json

.PHONY: import
import:
# https://holos.run/docs/v1alpha5/tutorial/helm-values/
	echo "import"