#!/bin/bash

git fetch origin

git pull origin main

if [ $? -ne 0 ]; then
  echo "Conflict detected. Resetting to remote main branch..."
  git reset --hard origin/main
  echo "Done! Your local files now match the remote."
else
  echo "Done! Everything is up to date."
fi