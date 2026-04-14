#!/bin/bash
# Copyright 2024-2025 NetCracker Technology Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Bridge TESTS_TAGS (set by operator) to TAGS (expected by base image entrypoint).
export TAGS="${TESTS_TAGS:-$TAGS}"
# Base scripts use ./tests and ./output relative to cwd; image has WORKDIR=/app but tests live in ROBOT_HOME/tests
cd "${ROBOT_HOME:-/opt/robot}" || exit 1
exec /docker-entrypoint.sh "$@"
