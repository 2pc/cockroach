#!/usr/bin/env bash
set -euxo pipefail
build/builder.sh make testrace TESTFLAGS='-v' 2>&1 | go-test-teamcity

build/builder.sh env GITHUB_API_TOKEN="$GITHUB_API_TOKEN" BUILD_VCS_NUMBER="$BUILD_VCS_NUMBER" TARGET=stressrace github-pull-request-make
