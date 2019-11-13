# Configuration - VM Resources

## Description

This section configures the system resources available to the Virtual Machine such as CPU and memory.

## Properties

### `cpus`

The number of virtual CPUs to configure on the Virtual Machine.

This should be equal to or less than the number of CPU cores on your host.

### `memory_mb`

The amount of memory to attach to the Virtual Machine in Megabytes.

This should be less than the amount of free memory on your host machine otherwise you will encounter performance issues.

### `video_memory_mb`

The amount of video memory to assign to the Virtual Machine in Megabytes.

This should be between 1 and 128.

### `video_3d_acceleration`

Determines if 3D video acceleration should be enabled.

### `monitor_count`

The number of monitors to set for the VM. Secondary monitor may need enabling in the view menu before being used.

### `rdp_port`

The port number to use for the Remote Desktop Connection.

To disable Remote Desktop support, this property should be removed. To use the default connection port (so that the port
does not need to be specified when connecting) set this to `3389`. If this port is already in use, the setup **will not
fail**. You should set this to an unused port number.

For more information, see [Connecting via Remote Desktop](../remote-desktop.md).

## Example

```yml
resource:
  cpus: 2
  memory_mb: 2048
  video_memory_mb: 128
  video_3d_acceleration: true
  monitor_count: 1
```
