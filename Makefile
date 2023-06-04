SHELL			:= bash
.SHELLFLAGS		:= -eu -o pipefail -c
MAKEFLAGS		+= --warn-undefined-variables
MAKEFLAGS		+= --no-builtin-rules
PROGNAME		:= archinst
BATS			!= which bats
BATS_OPTIONS	:= --verbose-run --show-output-of-passing-tests
BATS_GLOB		?=
CLI_ARGS		?=

test:
	@$(BATS) $(BATS_OPTIONS) -r tests/$(BATS_GLOB)

run:
	@bash $(PROGNAME) $(CLI_ARGS)

passwd:
	@openssl passwd -6

watch_run:
	@fd --type f \.bash$$ | entr -c bash $(PROGNAME) $(CLI_ARGS)

watch_test:
	@fd --type f "\.bats$$|\.bash$$" \
		| entr -c $(BATS) $(BATS_OPTIONS) -r tests/$(BATS_GLOB)

.PHONY: \
	passwd \
	run \
	test \
	watch_run \
	watch_test

.DEFAULT_GOAL := test
