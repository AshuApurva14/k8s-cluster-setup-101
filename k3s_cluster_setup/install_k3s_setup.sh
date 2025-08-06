#!/usr/bin/env bash

set -e


echo "K3s installation started........."

curl -sfL https://get.k3s.io | sh -

echo "Successfuly installed K3s cluster "

