# Configuration - Operating System

## Description

This section of the configuration determines OS level settings and configuration.

## Properties

### `hostname`

The hostname of the Virtual Machine.

This is also used for the Virtual Machine name in VirtualBox and should be unique from other Virtual Machines you have.

### `keyboard_layout`

The name of the file to apply for the keyboard layout.

See the [keyboard_layouts](../keyboard_layouts) directory of the repository for available options.

### `desktop`

The name of the desktop environment to install.

See the [desktops](../desktops) directory of the repository for available options.

## Example

```yaml
os:
  hostname: "condement"
  keyboard_layout: "en_gb"
  desktop: "xubuntu"
```
