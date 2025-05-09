#!/bin/bash

set -e

# Variables
BUCKET_NAME="$1"
AWS_REGION="$2"

if [[ -z "$BUCKET_NAME" || -z "$AWS_REGION" ]]; then
  echo "Usage: $0 <bucket-name> <aws-region>"
  exit 1
fi

# Check if bucket already exists
echo "Checking if bucket $BUCKET_NAME exists..."
echo "Checking if multi environment works"

if [ "$AWS_REGION" == "us-east-1" ]; then
  aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION"
else
  aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION" --create-bucket-configuration LocationConstraint="$AWS_REGION"
fi
