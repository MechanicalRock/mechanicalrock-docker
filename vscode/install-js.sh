#!/bin/bash

apt-get install software-properties-common
curl -sL https://deb.nodesource.com/setup_12.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update && apt-get install nodejs yarn -y

NODE_VERSION=$(node -v)
NPM_VERSION=$(npm -v) 
YARN_VERSION=$(yarn --version)

echo "node version = $NODE_VERSION"
echo "npm version = $NPM_VERSION"
echo "yarn version = $YARN_VERSION"
