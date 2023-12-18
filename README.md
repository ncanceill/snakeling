![logo](logo.png)

This is a test Python project to experiment with build and integration tools.

Features:
- Custom pdoc style
- Makefile targets for Python packaging
- Workflows for publishing to PyPI and GitHub Pages

## Disclaimer

This project is not affiliated with GitHub.

This project is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## Quickstart

1. Create a new git repository
   - Write a `pyproject.toml` file
   - Add your code in a `src` directory
   - Add your tests in a `tests` directory
   - Copy the `Makefile` and adapt it as needed
   - Copy the `.github/workflows` directory
1. Create a new GitHub repository and tune the settings
   - Create a tag protection rule
     - Tag: `v*`
   - Enable build and deployment for GitHub Pages
     - Source: GitHub Actions
   - Create an environment protection rule
     - Environment: `github-pages`
     - Deployment tag: `v*`
   - Create an environment protection rule
     - Environment: `testpypi`
     - Deployment tag: `v*`
1. Create a new TestPyPI Trusted Publisher
   - Workflow: `release.yml`
   - Environment: `testpypi`
1. Push a first commit to the `main` branch
   - Set the git remote to the newly created GitHub repository
   - Make sure the `Build` Action completes successfully
1. Make a first release
   - Tag the `main` branch as `v0.0.0`
   - Push the tag to GitHub
   - Create a release from tag `v0.0.0`
   - Make sure the `Release` Action completes successfully
1. Create a branch protection rule for `main`
   - [x] Require a pull request before merging
   - [x] Require status checks to pass before merging
     - [x] Require branches to be up to date before merging
     - Status checks that are required:
       - `Code quality`
       - `Documentation`
       - `Package distribution`
1. Optional improvements
   - Add a `.github/CODEOWNERS` file
   - Customize general settings
     - [ ] Allow merge commits
     - [ ] Allow rebase merging
     - [x] Always suggest updating pull request branches
     - [x] Automatically delete head branches
   - Improve the `main` branch protection rule
     - [x] Require approvals
     - [x] Require conversation resolution before merging 
     - [x] Require signed commits
     - [x] Require linear history

## Build

See the provided [Makefile](Makefile) for convenient targets:
- `make package` to build source and wheel distributions (requires `build`)
- `make doc` to build HTML documentation from docstrings (requires `pdoc`)
- `make format` to autoformat the code (requires `black` and `isort`)
- `make lint` to check code quality (requires `flake8` and `Flake8-pyproject`)
- `make type` to typecheck the code (requires `mypy`)
- `make test` to run unit tests

## References

Useful sources of information:
- [GNU Make Manual](https://www.gnu.org/software/make/manual/)
- [PyPI Common questions](https://pypi.org/help/)
- [Python Packaging User Guide](https://packaging.python.org)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)

## License

The code is free software: you can redistribute it and/or modify it under the terms of the [GNU General Public License](https://www.gnu.org/licenses/) as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The logo is free art: you can redistribute it and/or modify it under the terms of the [CC BY-NC-SA 4.0 License](https://creativecommons.org/licenses/) as published by Creative Commons.

You should have received a [copy](COPYING.md) of the GNU General Public License along with this project.

***

Copyright © 2023 Nicolas Canceill
