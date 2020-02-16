# ddns-tf

A home DDNS for Route53 URLs powered by Terraform.

The external IP of the network in which the job is run will be added as an 'A' record for any URLs included in the config.yaml file.

When scheduled, this module emulates the behavior of a traditional DDNS, provided the above external IP is unaffected by any complex routing (e.g. VPN).

## Instructions

1. Install the [Terraform CLI](https://www.terraform.io/downloads.html)
2. Ensure you have defined local AWS credentials
3. If you have not initialised Terraform in the directory, run ```Terraform init```

### Single run

1. Run ```Terraform plan```
2. Review the planned changes
3. Run ```Terraform apply```

### Scheduled run (OS X)

1. Apply a [cron job](https://www.adminschoice.com/crontab-quick-reference) to call ```Terraform apply -auto-approve``` at the desired frequency

## Providers

No provider.

## Required Inputs

No required input.

## Optional Inputs

The following input variables are optional (have default values):

### region

Description: The AWS region in which the profile credentials are valid.

Type: `string`

Default: `"eu-west-2"`

### yaml\_config

Description: Location of the yaml file containing the URLS to be redirected relative to the root module.

Type: `string`

Default: `""`

## Outputs

No output.

