# Configuration - Software

## Description

Unlike other sections, the software section can change drastically for each configuration. In it's most basic form, the
software section is a yaml map of empty objects. Each item in the map is the Software ID of the software package to be
installed. For information about available software pacakges, see the [software documentation](../software/).

```yml
software:
  docker:
  k3s:
  kubernetes-dashboard:
```

In more complicated configurations, each item in the software map can include configuration for more specific
installation instructions, this may be selecting a version number, installing addition components or other actions. For
details of the available configuration properties, see the documentation page for the software being installed.

```yml
software:
  docker:
  k3s:
  terraform:
    version: '0.12.18'
  kubernetes-dashboard:
  azure-data-studio:
    version: '1.6.0'
  vscode:
    extensions:
    - editorconfig.editorconfig
    - davidanson.vscode-markdownlint

```
