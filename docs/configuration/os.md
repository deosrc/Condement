# Configuration - Operating System

## Description

This section of the configuration determines OS level settings and configuration.

## Properties

### `hostname`

The hostname of the Virtual Machine.

This is also used for the Virtual Machine name in VirtualBox and should be unique from other Virtual Machines you have.

### `keyboard_layout`

The name of the file to apply for the keyboard layout.

See the [keyboard_layouts](../../keyboard_layouts) directory of the repository for available options.

### `desktop`

The name of the desktop environment to install.

See the [desktops](../../desktops) directory of the repository for available options.

### `update_packages`

Determines if the installed packages should be updated as part of the VM build.

Depending on how old your base image is, having this enabled may add significant runtime to the build, however,
disabling it may pose security issues. If the build is taking a long time due to this stage, see
[Updating the base image](../using-the-vm#updating-the-base-image).

## Example

```yaml
os:
  hostname: "condement"
  keyboard_layout: "en_gb"
  desktop: "xubuntu"
```
