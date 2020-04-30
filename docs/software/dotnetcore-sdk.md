# Software - .NET Core SDK

|                             |                                                                |
| --------------------------- | -------------------------------------------------------------- |
| Version                     | `various`                                                      |
| Condement Software ID       | `dotnetcore-sdk`                                               |
| Website                     | [dotnet.microsoft.com](https://dotnet.microsoft.com/)          |
| License                     | [MIT](https://github.com/dotnet/core/blob/master/LICENSE.TXT)  |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                            |
| Persistent Storage          | No                                                             |
| Other Software Dependencies | [Microsoft Package Repository](./microsoft-package-repository) |

## Description

![.net core logo](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/.NET_Core_Logo.svg/150px-.NET_Core_Logo.svg.png)

.NET Core is a free and open-source, managed computer software framework for Windows, Linux, and macOS operating
systems. It is a cross-platform successor to .NET Framework.

Source: [Wikipedia](https://en.wikipedia.org/wiki/.NET_Core)

## Install Notes

.NET Core is installed from the Ubuntu "universe" package repository. This is officially supported by Microsoft.

The Condement software package for the Microsoft Package Repository is included automatically. There is no need to
specify it in the configuration file.

### Configuration Settings

**Example:**

```yaml
dotnetcore-sdk:
  versions:
    - "2.1"
    - "3.1"
```

#### `versions`

|      |        |
| ---- | ------ |
| Type | `List` |

A list of SDK versions to be installed.

## Limitations

None known.
