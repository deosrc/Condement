# Configuration - Port Forwarding

## Description

Port forwarding allows you to expose services on your Virtual Machine to your host machine. This can be useful for
testing purposes or just for ease of use.

Any forwarded ports are only exposed to the host machine and not the wider network. If you wish to access services
from another machine, you will need to configure the port forwarding in VirtualBox manually.

## Properties

Each port forwarding configuration must have a unique name (which is the key) and the following properties:

### `protocol`

**Valid Values:** `tcp` or `udp`

The name of the protocol to forward.

### `host_port`

The port number which the service will be accessed via on the host. This cannot be a port which is already in use.

### `vm_port`

The port number used by the service on the VM.

## Additional Notes

Some software packages may create services on certain ports (e.g. the [k3s](../software/k3s) software package exposes
the ingress controller on ports 80 and 443). Port forwarding can be used to allow access to these services from your
host machine.

To determine the ports a software package uses for its services, check the page for the software package.

## Example

```yaml
forwarded_ports:
  http:
    protocol: tcp
    host_port: 8080
    vm_port: 80
```
