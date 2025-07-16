#!/bin/bash

# This test file will be executed against the 'python3_10' scenario in scenarios.json
# that includes the 'uv' feature with a Python 3.10 base image.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# Check if uv is installed and in the PATH
check "uv is in PATH" bash -c "command -v uv"

# Check if uv is functional
check "uv version" bash -c "uv --version"

# Check that uv works with the Python 3.10 installation
check "python version is 3.10" bash -c "python --version | grep -q 'Python 3.10'"

# Create a requirements.txt file with a few packages
echo "requests==2.31.0
pytest==7.3.1" > /tmp/requirements.txt

# Test package installation with requirements.txt
check "uv can install from requirements.txt" bash -c "uv pip install -r /tmp/requirements.txt && python -c 'import requests, pytest; print(\"Packages installed successfully\")'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
