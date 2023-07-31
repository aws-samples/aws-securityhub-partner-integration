#!/bin/bash
# Copyright 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved..
# SPDX-License-Identifier: MIT-0


set -e

export PRODUCT_NAME=$(cat parameters.json | jq -r '.[] | select(.ParameterKey == "ProductName") | .ParameterValue')

if [ -z "$AWS_REGION" ]; then
  echo "Error: Please setup AWS_REGION environment variable"
  exit 1
fi

if [[ ! "$PRODUCT_NAME" =~ ^[a-zA-Z0-9\-]+$ ]]; then
  echo "Error: Invalid product name format. Only letters, digits, and hyphens are allowed."
  exit 1
fi

STACKSET_NAME=securityhub-integration-$PRODUCT_NAME

if [[ $1 = "deploy" ]]; then
  aws cloudformation deploy \
  --template-file template/template.yaml \
  --stack-name $STACKSET_NAME \
  --parameter-overrides file://./parameters.json \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
  --region $AWS_REGION
fi

if [[ $1 = "destroy" ]]; then

  aws cloudformation delete-stack \
  --stack-name $STACKSET_NAME \
  --region $AWS_REGION
fi