#!/bin/bash

# This test file will be executed against the 'default' scenario in scenarios.json
# that includes the 'uv' feature with default options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# Check if uv is installed and in the PATH
check "uv is in PATH" bash -c "command -v uv"

# Check if uv is functional
check "uv version" bash -c "uv --version"

# Test basic package installation functionality
check "uv can install packages" bash -c "uv pip install --quiet requests && python -c 'import requests; print(requests.__version__)'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
