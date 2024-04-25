## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_overwrite | Whether to allow overwrite of Route53 records | `bool` | `true` | no |
| certificate\_body | Path of certificate body. | `string` | `"~"` | no |
| certificate\_chain | Path of certificate chain. | `string` | `""` | no |
| domain\_name | A domain name for which the certificate should be issued. | `string` | `""` | no |
| enable | Whether or not to enable the entire module or not. | `bool` | `true` | no |
| enable\_aws\_certificate | Set to false to prevent the creation of a acm certificate. | `bool` | `true` | no |
| enable\_dns\_validation | Set to prevent validation of DNS. | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| import\_certificate | Set to true or false to decide the creation and import of a acm certificate. | `bool` | `false` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| private\_key | Path of private key. | `string` | `""` | no |
| private\_zone | Used with name field to get a private Hosted Zone. | `bool` | `false` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-acm"` | no |
| subject\_alternative\_names | Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation. | `list(any)` | `[]` | no |
| ttl | Time to live. | `number` | `600` | no |
| validate\_certificate | Set to false to prevent the validation of a acm certificate. | `bool` | `false` | no |
| validation\_method | Which method to use for validation, DNS or EMAIL. | `string` | `"DNS"` | no |
| validation\_option | The domain name that you want ACM to use to send you validation emails. This domain name is the suffix of the email addresses that you want ACM to use. | `any` | `{}` | no |
| validation\_record\_fqdns | When validation is set to DNS and the DNS validation records are set externally, provide the fqdns for the validation | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| acm\_certificate\_domain\_validation\_options | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| acm\_certificate\_status | Status of the certificate. |
| arn | The ARN of the Certificate. |
| id | The ID of the Certificate. |
| tags | A mapping of tags to assign to the resource. |
| validation\_route53\_record\_fqdns | List of FQDNs built using the zone domain and name. |

