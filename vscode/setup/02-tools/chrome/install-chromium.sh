#! /bin/sh
apt-get update && apt-get install -y \
      chromium-browser \
      fonts-liberation \
      fonts-roboto \
      hicolor-icon-theme \
      libcanberra-gtk-module \
      libexif-dev \
      libgl1-mesa-dri \
      libgl1-mesa-glx \
      libpango1.0-0 \
      libv4l-0 \
      fonts-symbola \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
    

