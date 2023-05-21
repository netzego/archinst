PROGNAME		:= bashskel.bash
BATS			!= which bats
BATS_OPTIONS	:= --verbose-run --show-output-of-passing-tests
BATS_GLOB		?=
CLI_ARGS		?=

test:
	@$(BATS) $(BATS_OPTIONS) -r test/$(BATS_GLOB)

run:
	@bash $(PROGNAME) $(CLI_ARGS)

watch_run:
	@fd --type f \.bash$$ | entr -c bash $(PROGNAME) $(CLI_ARGS)

watch_test:
	@fd --type f "\.bats$$|\.bash$$" | entr -c $(BATS) $(BATS_OPTIONS) -r test/$(BATS_GLOB)

.PHONY: \
	run \
	test \
	watch_run \
	watch_test

.DEFAULT_GOAL := test
