#!/bin/bash
source 00.config.sh
echo ">>> Import root CA to OS trust store"
cd $PWD/certs
cp ca.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust extract
echo ">>> Done 🎉"
echo ">>> [1/5] Checking root permission..."
if [ "$EUID" -ne 0 ]; then
  echo "Pls run this script as root(sudo or su -)"
  exit 1
fi

echo ">>> [2/5] Checking subscription..."
subscription-manager status >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "⚠️  System not registered with Red Hat Subscription Management."
  echo "👉 Pls run command:"
  echo "sudo subscription-manager register --username <email> --password <password>"
  echo "and then run this script again ."
  exit 1
fi

echo ">>> [3/5] Updating..."
dnf clean all
dnf -y update

echo ">>> [4/5] Installing Podman..."
dnf -y install podman

if [ $? -ne 0 ]; then
  echo "❌ Error installing Podman."
  exit 1
fi

echo ">>> [5/5] Check version Podman..."
podman_version=$(podman --version 2>/dev/null)
if [ $? -eq 0 ]; then
  echo "✅Install sucessfully! $podman_version"
else
  echo "⚠️  Podman is not installed correctly. Please check the logs for more details.."
fi

echo ">>> Done 🎉"
