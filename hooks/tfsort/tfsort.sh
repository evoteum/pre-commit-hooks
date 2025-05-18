#!/usr/bin/env bash
set -eo pipefail

# sensible default names for use if files are not provided
basenames=(
  "outputs"
  "variables"
)
extensions=(
  "tf"
  "tofu"
)

find_files() {
  if [ $# -ne 0 ]; then
    files=("$@")
    echo "Got files, so I'll use those"
    return 0
  fi

  echo "No files provided, so I'll just look for relevant files..."
  local find_args=()
  for basename in "${basenames[@]}"; do
    for extension in "${extensions[@]}"; do
      find_args+=(-name "${basename}.${extension}" -o)
    done
  done
  unset "find_args[${#find_args[@]}-1]"

  mapfile -t files < <(find . -type f \( "${find_args[@]}" \))
}

find_files "$@"

for file in "${files[@]}"; do
  if [[ -f "$file" && -s "$file" ]]; then
    echo "Sorting $file..."
    tfsort "$file"
  fi
done
