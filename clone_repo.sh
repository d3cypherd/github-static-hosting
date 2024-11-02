#!/bin/bash

REPO_URL="$1"

REPO_NAME=$(basename "$REPO_URL")

git clone $REPO_URL /var/www/${REPO_NAME}
