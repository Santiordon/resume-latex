#!/bin/bash

echo "What did you change? (this will be your commit message)"
read -r message

if [ -z "$message" ]; then
  echo "Error: commit message cannot be empty."
  exit 1
fi

git add .
git commit -m "$message"
git push

echo "Done! Changes saved and uploaded."