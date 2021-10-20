#!/bin/bash
set -euo pipefail

echo "############"
echo "### Installing AWS Tools"
echo "############"


# Amplify
npm install -g @aws-amplify/cli

# AWS SAM CLI
pip3 install aws-sam-cli

pip3 install aws-sso-util

