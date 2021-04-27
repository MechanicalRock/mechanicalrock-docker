#! /bin/sh
apt-get update && apt-get install -y \
      epiphany-browser \
      gnome-keyring \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
