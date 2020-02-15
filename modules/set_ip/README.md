## Providers

The following providers are used by this module:

- aws

## Required Inputs

The following input variables are required:

### home\_ip

Description: The external IP address of the local network.

Type: `string`

### route\_53\_urls

Description: The Route53 URLs to which the record sets will be applied.

Type: `set(string)`

## Optional Inputs

No optional input.

## Outputs

The following outputs are exported:

### record\_sets

Description: The record sets redirecting the input URLs to the home_ip.

