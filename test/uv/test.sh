#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'uv' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "uv": {}
#    },
#    "remoteUser": "root"
# }
#
# This test can be run with the following command:
#
#    devcontainer features test \ 
#                   --features uv   \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# Check if uv is installed and in the PATH
check "uv is in PATH" bash -c "command -v uv"

# Check if uv is functional
check "uv version" bash -c "uv --version"

# Check if uv can create a virtual environment
check "uv can create venv" bash -c "uv venv -f /tmp/test-venv && test -d /tmp/test-venv"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
