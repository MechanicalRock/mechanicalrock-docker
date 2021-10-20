#! /bin/sh
set -euo pipefail

echo "############"
echo "### Installing Browser (Epiphany)"
echo "############"

sudo apt-get update 

sudo apt-get install -y \
      epiphany-browser \
      gnome-keyring \
      --no-install-recommends \
    
