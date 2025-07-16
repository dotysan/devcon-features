#! /usr/bin/env bash
set -e
# set -x

UV_INSTALLER="https://gist.github.com/dotysan/fdbfc77b924a08ceab7197d010280dac/raw/uv-install.sh"

hash curl
# export DEBUG=yep
curl --silent --show-error --fail --location "$UV_INSTALLER" |bash
