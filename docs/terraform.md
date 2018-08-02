
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acl | The canned ACL to apply to the S3 bucket | string | `private` | no |
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| cluster_name | Kops cluster name (e.g. `us-east-1` or `cluster-1`) | string | `us-east-1` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | string | `-` | no |
| domain_enabled | A boolean that determines whether a DNS Zone for the kops domain is created | string | `true` | no |
| force_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without errors. These objects are not recoverable | string | `false` | no |
| name | Name (e.g. `kops-state`) | string | `kops-state` | no |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| parent_zone_id | Parent DNS zone ID | string | `` | no |
| parent_zone_name | Parent DNS zone name (e.g. `domain.com`) | string | `` | no |
| region | AWS Region the S3 bucket should reside in | string | `us-east-1` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |
| zone_name | Template for the DNS zone name | string | `$${name}.$${parent_zone_name}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_arn | S3 bucket ARN |
| bucket_domain_name | S3 bucket domain name |
| bucket_id | S3 bucket ID |
| bucket_name | S3 bucket name |
| bucket_region | S3 bucket region |
| parent_zone_id | Parent zone ID |
| parent_zone_name | Parent zone name |
| zone_id | `kops` cluster zone ID |
| zone_name | `kops` cluster zone name |

