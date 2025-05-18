# tfsort Pre-Commit Hook

A pre-commit hook for automatically sorting Terraform and OpenTofu variable and output files using [`tfsort`](https://github.com/AlexNabokikh/tfsort).

## What It Does

When used as a pre-commit hook, this script will:

- Automatically find and sort variables and outputs files with the .tf and .tofu extensions.
- Skip empty files or files not relevant to Terraform/Tofu variable and output declarations.
- Support manually specifying a list of files or letting the script use sensible defaults.
- Let you override the file list by specifying `files:` in your `.pre-commit-config.yaml`.

## Why This Exists

We like clean infrastructure code. This hook helps keep variable and output files readable and consistent without manual effort.

We also practice test-driven development, so this hook comes with tests to check it behaves exactly as expected. See the [Tests](#tests) section below.

## Installation

Install `tfsort` by following the instructions at the [official repository](https://github.com/AlexNabokikh/tfsort):

Then, add this hook to your `.pre-commit-config.yaml`:

```yaml
- repo: https://github.com/evoteum/pre-commit-hooks
  hooks:
    - id: tfsort
      name: tfsort for variables and outputs
      entry: tfsort/tfsort.sh
      language: script
      # Optional: override default filenames
      # files: ^(variables_custom|outputs_custom)(\.tf|\.tofu)$
```

If you have differently named files, set the `files:` key with a regex pattern in your `.pre-commit-hook-config.yaml`.

## Tests

This project includes tests using Bats. To use these, you will need the bats-assert and bats-support helper libraries. To keep your development environment clean and predictable, we recommend cloning all related projects into a shared parent directory. For example:

```shell
example-directory/
├── bats-assert
├── bats-support
└── pre-commit-hooks
```

You should also [install bats](https://bats-core.readthedocs.io/en/stable/installation.html).

Then you can run the tests with:

```shell
bats tfsort/test/test-tfsort.bats
```

## Compatibility
- Requires tfsort to be installed and on your PATH.
- Tested with files formatted for Terraform and OpenTofu.
- Works on macOS and Linux.
