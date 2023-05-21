#!/usr/bin/bash
# shellcheck disable=SC2154

@test "print bats special variables" {
    # https://bats-core.readthedocs.io/en/stable/writing-tests.html#special-variables
    echo "BATS_RUN_COMMAND: ${BATS_RUN_COMMAND}"
    echo "BATS_TEST_FILENAME: ${BATS_TEST_FILENAME}"
    echo "BATS_TEST_DIRNAME: ${BATS_TEST_DIRNAME}"
    echo "BATS_TEST_NAMES: ${BATS_TEST_NAMES}"
    echo "BATS_TEST_NAME: ${BATS_TEST_NAME}"
    echo "BATS_TEST_NAME_PREFIX: ${BATS_TEST_NAME_PREFIX}"
    echo "BATS_TEST_DESCRIPTION: ${BATS_TEST_DESCRIPTION}"
    echo "BATS_TEST_RETRIES: ${BATS_TEST_RETRIES}"
    echo "BATS_TMPDIR: ${BATS_TMPDIR}"
    echo "BATS_RUN_TMPDIR: ${BATS_RUN_TMPDIR}"
    echo "BATS_FILE_EXTENSION: ${BATS_FILE_EXTENSION}"
    echo "BATS_SUITE_TMPDIR: ${BATS_SUITE_TMPDIR}"
    echo "BATS_FILE_TMPDIR: ${BATS_FILE_TMPDIR}"
    echo "BATS_VERSION: ${BATS_VERSION}"
}
