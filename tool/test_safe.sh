#!/usr/bin/env bash

set -euo pipefail

# Flutter can start one Dart frontend compiler per test process. On this
# project, allowing the default parallelism can exhaust the host memory and
# make the kernel kill terminals or IDE processes as well.
test_concurrency="${IBIVIBE_TEST_CONCURRENCY:-1}"
test_timeout="${IBIVIBE_TEST_TIMEOUT:-60s}"
run_timeout="${IBIVIBE_TEST_RUN_TIMEOUT:-300s}"
memory_bytes="${IBIVIBE_TEST_MEMORY_BYTES:-4294967296}"
cpu_seconds="${IBIVIBE_TEST_CPU_SECONDS:-300}"

test_command=(
  flutter test
  --no-pub
  --concurrency="$test_concurrency"
  --timeout="$test_timeout"
  "$@"
)

if command -v prlimit >/dev/null 2>&1; then
  test_command=(prlimit --as="$memory_bytes" --cpu="$cpu_seconds" -- "${test_command[@]}")
fi

if command -v timeout >/dev/null 2>&1; then
  exec timeout --signal=TERM --kill-after=10s "$run_timeout" "${test_command[@]}"
fi

exec "${test_command[@]}"
