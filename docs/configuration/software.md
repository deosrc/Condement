# Configuration - Software

## Description

Unlike other sections, the software section is a simple list of software to install. Each entry in the list must be a
string matching a file within the [software](../../software) directory of the repository (without the file extension).

If you wish to quickly disable a piece of software, you can do so by adding a `#` to the beginning of the line.

## Example

```yml
software: [
  'vscode',
  #'azure-data-studio',
  'docker',
  'k3s',
  'kubernetes-dashboard',
  'firefox',
  #'chromium',
  'golang',
  'gitkraken',
  ]
```
