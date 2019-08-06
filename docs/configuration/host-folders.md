# Configuration - Host Folders

## Description

Host folders allow you to mount a directory from your host machine into the Virtual Machine. This is used to ensure
persistent storage is available across VM rebuilds (e.g. if you break your VM, you don't lose all of your code!).

## Properties

Each host folder must have a unique name (which is the key) and the following properties:

### `source`

The location of the folder on the host machine. This directory must exist before building or launching the VM. If the
folder does not exist, creation of the VM will fail and launching the VM will produce unexpected results (this could be
an empty folder or the VM may fail to start).

Source folders can be relative to the home directory of the user building the VM. This is indicated by a `~`.

### `target`

The location of the folder within the VM. This should always be an absolute path. To store this in the user's home
directory, use a subfolder of `/home/dev/`.

## Persistent Storage

The `persistent_storage` host folder is a special entry. Installed software will map their configuration files to
`/mnt/persistent_storage`. Mapping this to the host machine allows settings such as editor preferences to persist
between Virtual Machine rebuilds.

This entry also allows the use of the `<hostname>` tag in the `source` property. This will be replaced by the hostname
of the Virtual Machine so that you can have different settings for different machine purposes. This is only available
for the `persistent_storage` host folder.

## Ownership and Permissions

Due to the limitations of VirtualBox Shared Folders, the owner and permissions of files within a host folder cannot be
modified. This is because these settings cannot map to filesystems such as NTFS.

As a result and in order to provide
best compatibility, all host folders are mounted with the `dev` user and group as the owner and use `0755` permissions.
This results in the following:

|       | Read     | Write    | Execute  |
| ----- | -------- | -------- | -------- |
| User  | &#10004; | &#10004; | &#10004; |
| Group | &#10004; | &#10006; | &#10004; |
| Other | &#10004; | &#10006; | &#10004; |

## Example

```yaml
host_folders:
  repos:
    source: "~\\Repos"
    target: "/home/dev/Repos"

  persistent_storage:
    source: "~\\CondementPersistent\\<hostname>"
    target: "/mnt/persistent_storage"
```
