# tf_kops_bootstrap

Easily bootstrap dependencies for `kops` (config bucket & DNS zone)

## Usage

Provision environment for `foobar.example.com`.

```
module "kops" {
  source          = "git::https://github.com/cloudposse/tf_kops_bootstrap.git?ref=master"
  namespace       = "example"
  stage           = "dev"
  name            = "foobar"
  parent_dns_zone = "example.com"
}
```

This example will create a DNS zone called `foobar.example.com` and delegate it from `example.com` by setting `NS` and `SOA` records. It will also provision a bucket called `config.foobar.example.com` for storing kops manifests.
