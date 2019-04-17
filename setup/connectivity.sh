#!/usr/bin/env bash

# Checking up for Internet availability
echo 'Verifying Internet connectivity 📡'

if [[ ! $(ping -c 2 google.com) ]]; then
  echo 'No Internet connectivity ⚠️'
  exit 1
fi

echo 'Connected to Internet 🛰'

