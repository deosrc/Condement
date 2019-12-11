# Software - Azure Data Studio

|                             |                                                                                              |
| --------------------------- | -------------------------------------------------------------------------------------------- |
| Version                     | [Configurable](#version) (default 1.6.0)                                                     |
| Condement Software ID       | azure-data-studio                                                                            |
| Website                     | [docs.microsoft.com/sql/azure-data-studio](https://docs.microsoft.com/sql/azure-data-studio) |
| License                     | [MIT License](https://github.com/microsoft/sqltoolsservice/blob/master/license.txt)          |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                                                          |
| Persistent Storage          | Yes                                                                                          |
| Other Software Dependencies | None                                                                                         |

## Description

Azure Data Studio is a cross-platform database tool for data professionals using the Microsoft family of on-premises
and cloud data platforms on Windows, MacOS, and Linux.

Source: [docs.microsoft.com/sql/azure-data-studio](https://docs.microsoft.com/sql/azure-data-studio)

## Install Notes

Installed from official Microsoft source.

### Configuration Settings

**Example:**

```yaml
terraform:
  version: '1.6.0'
```

#### `version`

|         |           |
| ------- | --------- |
| Type    | `string`  |
| Default | `'1.6.0'` |

The Azure Data Studio version to be installed.

## Limitations

None known.
