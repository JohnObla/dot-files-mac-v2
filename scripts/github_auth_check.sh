#!/bin/bash

if gh auth status >/dev/null 2>&1;
then
  echo "Already logged in to GitHub CLI.";
  exit 0;
else
  gh auth login --git-protocol=ssh --web;
fi
