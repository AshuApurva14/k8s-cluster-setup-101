#!/usr/bin/env bash

set -e

# Install and setup Kind cluster in Linux Environment

# CURL to kind package
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64

# change the file permission
chmod +x ./kind

# Move file into /usr/local/bin/kind
sudo mv ./kind /usr/local/bin/kind

# Check the Kiind version
kind version



