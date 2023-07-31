<!--
 Copyright 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved..
 SPDX-License-Identifier: MIT-0
-->

# Enabling partner integrations with AWS Security Hub across AWS Organization

Stack set templates to deploy a partner integration in AWS Security Hub across an AWS Organization.

## Prerequisites

1. AWS Security Hub enabled across AWS Organization.
2. Trusted access with AWS Organization is enabled. This enables you to deploy Cloudformation Stack sets across an AWS Organization. You can find how to enable here. 
3. Permissions to deploy CloudFormation Stack sets in an StackSet delegated administrator account.
4. AWS Command Line Interface (AWS CLI) installed.

## Deploying a new integration

1. Configure `parameters.json` with:
* `ProductName`: Name of the product being enabled.
* `ProductArn`: Arn for the AWS Security Hub partner. You can find it under this [link](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-partner-providers.html).
* `DeploymentTargets`: List of AWS Organization Units (OU) Ids to deploy the stack.
* `DeploymentVersion`: Version number, increase and re-deploy when enabling AWS Security Hub in new regions.
2. Run `./setup.sh deploy`

## Disabling integration

To disable the partner product run `./setup.sh destroy` from your terminal.

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

