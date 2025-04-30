[//]: # (STANDARD README)
[//]: # (https://github.com/RichardLitt/standard-readme)
[//]: # (----------------------------------------------)
[//]: # (Uncomment optional sections as required)
[//]: # (----------------------------------------------)

[//]: # (Title)
[//]: # (Match repository name)
[//]: # (REQUIRED)

# pre-commit-hooks

[//]: # (Banner)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (Must link to local image in current repository)


[//]: # (Badges)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)


[//]: # (Short description)
[//]: # (REQUIRED)
[//]: # (An overview of the intentions of this repo)
[//]: # (Must not have its own title)
[//]: # (Must be less than 120 characters)
[//]: # (Must match GitHub's description)

Reusable pre-commit hooks for managing code style and quality

[//]: # (Long Description)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (A detailed description of the repo)



## Table of Contents

[//]: # (REQUIRED)
[//]: # (Delete as appropriate)

1. [Security](#security)
1. [Background](#background)
1. [Install](#install)
1. [Usage](#usage)
1. [Documentation](#documentation)
1. [Repository Configuration](#repository-configuration)
1. [Contributing](#contributing)
1. [License](#license)

## Security
[//]: # (OPTIONAL)
[//]: # (May go here if it is important to highlight security concerns.)

Hooks are intended to be run locally using the [pre-commit](https://pre-commit.com/) framework. Always audit scripts you add to your project.


## Background
[//]: # (OPTIONAL)
[//]: # (Explain the motivation and abstract dependencies for this repo)

Managing code style and quality across repositories can be repetitive. This repo provides reusable, centrally maintained hooks to reduce duplicated effort and ensure consistency.

Examples include:

- Sorting Terraform blocks with [`tfsort`](tfsort/)
- Auto-formatting Python with `black` or `isort`
- Removing trailing whitespace and fixing EOFs
- Validating OpenTofu configuration

## Install

[//]: # (Explain how to install the thing.)
[//]: # (OPTIONAL IF documentation repo)
[//]: # (ELSE REQUIRED)


Install the [pre-commit](https://pre-commit.com/#install) framework:

```sh
brew install pre-commit     # macOS
pip install pre-commit      # cross-platform
```

Then in your project repo, configure hooks:

```yaml
# .pre-commit-config.yaml
- repo: https://github.com/evoteum/pre-commit-hooks
  rev: main
  hooks:
    - id: tfsort
```

Run:

```sh
pre-commit install
pre-commit run --all-files
```

## Usage
[//]: # (REQUIRED)
[//]: # (Explain what the thing does. Use screenshots and/or videos.)


Each hook has its own README and test suite. See [`tfsort`](tfsort/) for a real example.

Some hooks work best with default file patterns, requiring no `files:` entry. Others may need explicit regex patterns if filenames are nonstandard.

[//]: # (Extra sections)
[//]: # (OPTIONAL)
[//]: # (This should not be called "Extra Sections".)
[//]: # (This is a space for ≥0 sections to be included,)
[//]: # (each of which must have their own titles.)


## Testing

We practice test-driven development, so each hook has tests.


## Documentation

Further documentation is in the [`docs`](docs/) directory.

## Repository Configuration

> [!WARNING]  
> This repo is controlled by OpenTofu in the [estate-repos](https://github.com/evoteum/estate-repos). repository.  
>  
> Manual configuration changes will be overwritten the next time OpenTofu runs.


[//]: # (## API)
[//]: # (OPTIONAL)
[//]: # (Describe exported functions and objects)



[//]: # (## Maintainers)
[//]: # (OPTIONAL)
[//]: # (List maintainers for this repository)
[//]: # (along with one way of contacting them - GitHub link or email.)



[//]: # (## Thanks)
[//]: # (OPTIONAL)
[//]: # (State anyone or anything that significantly)
[//]: # (helped with the development of this project)



## Contributing
[//]: # (REQUIRED)
If you need any help, please log an issue and one of our team will get back to you.

PRs are welcome.


## License
[//]: # (REQUIRED)

All our code is licenced under the AGPL-3.0. See [LICENSE](LICENSE) for more information.
