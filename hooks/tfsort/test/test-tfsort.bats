#!/usr/bin/env bats


load '../../../bats-support/load'
load '../../../bats-assert/load'
SCRIPT_PATH="${BATS_TEST_DIRNAME}/../tfsort.sh"

setup() {
  TMPDIR="$(mktemp -d)"
  TESTDATA="${BATS_TEST_DIRNAME}/testdata/"
  TESTDATA_UNSORTED="${TESTDATA}/unsorted"
  TESTDATA_EXPECTED="${TESTDATA}/expected"
  cp -r "${TESTDATA_UNSORTED}/." "$TMPDIR/"
}

teardown() {
  rm -rf "$TMPDIR"
}

@test "when no files are provided, default filenames are used, so vars.tofu is ignored" {
  run "$SCRIPT_PATH"
  refute_output --partial "Sorting vars.tofu"
}

@test "sorting specific vars.tofu works correctly" {
  cp "${TESTDATA_UNSORTED}/vars.tofu" "$TMPDIR/vars.tofu"
  run "$SCRIPT_PATH" "$TMPDIR/vars.tofu"
  assert_success
  run diff "$TMPDIR/vars.tofu" "${TESTDATA_EXPECTED}/vars.tofu"
  assert_success
}

@test "only vars.tofu is sorted when specified" {
  run "$SCRIPT_PATH" "$TMPDIR/vars.tofu"
  assert_success
  # Other files must remain unchanged
  run diff "$TMPDIR/variables.tf" ${TESTDATA_UNSORTED}/variables.tf
  assert_success
  run diff "$TMPDIR/variables.tofu" ${TESTDATA_UNSORTED}/variables.tofu
  assert_success
}

@test "sorting all default files except matches expected output" {
  run "$SCRIPT_PATH"
  assert_success

  for file in variables.tf variables.tofu outputs.tf outputs.tofu; do
    run diff "$TMPDIR/$file" "${TESTDATA_EXPECTED}/$file"
    assert_success
  done
}

@test "empty files are skipped" {
  touch "$TMPDIR/empty.tf"
  run "$SCRIPT_PATH"
  assert_success
  refute_output --partial "Sorting empty.tf"
}

@test "sorting all supported files explicitly matches expected output" {
  run "$SCRIPT_PATH" "$TMPDIR"/variables.tf "$TMPDIR"/variables.tofu "$TMPDIR"/outputs.tf "$TMPDIR"/outputs.tofu
  assert_success

  for file in variables.tf variables.tofu outputs.tf outputs.tofu; do
    run diff "$TMPDIR/$file" "${TESTDATA_EXPECTED}/$file"
    assert_success
  done
}
