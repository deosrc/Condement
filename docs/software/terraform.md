# Software - Terraform

|                             |                                                                                         |
| --------------------------- | --------------------------------------------------------------------------------------- |
| Version                     | [Configurable](#version) (default 0.12.6)                                               |
| Condement Software ID       | terraform                                                                               |
| Website                     | [terraform.io](https://www.terraform.io/)                                               |
| License                     | [Mozilla Public License V2](https://github.com/hashicorp/terraform/blob/master/LICENSE) |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                                                     |
| Persistent Storage          | No                                                                                      |
| Other Software Dependencies | None                                                                                    |

## Description

HashiCorp Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open
source tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as
code, edited, reviewed, and versioned.

Source: [terraform.io](https://www.terraform.io/)

## Install Notes

Installed from official Hashicorp releases.

### Configuration Settings

**Example:**

```yaml
terraform:
  version: '0.12.18'
```

#### `version`

|         |            |
| ------- | ---------- |
| Type    | `string`   |
| Default | `'0.12.6'` |

The terraform version to be installed.

## Limitations

None known.
