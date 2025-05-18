#!/bin/bash
set -euo pipefail

for file in "$@"; do
  yq eval 'with(.[]; select(tag == "!!seq") |= sort | unique)' -i "$file"
done