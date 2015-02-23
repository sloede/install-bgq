#!/bin/bash

# Run all scripts in the correct order
for s in before.sh inst0.sh inst1.sh inst2.sh modify_path_472.sh; do
  echo "Running $s..."
  ./$s
  if [ $? -eq 1 ]; then
    echo "error: previous script ($s) failed" >&2
    exit 1
  fi
  echo
done
