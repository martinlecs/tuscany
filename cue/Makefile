.PHONY: gen
gen:
	holos render platform

.PHONY: debug
debug:
	cue eval $(FILE)
	cue export $(FILE) --out json
