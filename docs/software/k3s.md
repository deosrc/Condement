# Software - k3s

|                             |                                                                  |
| --------------------------- | ---------------------------------------------------------------- |
| Condement Software ID       | `k3s`                                                            |
| Website                     | [k3s.io](https://k3s.io/)                                        |
| License                     | [Apache 2.0](https://github.com/rancher/k3s/blob/master/LICENSE) |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                              |
| Persistent Storage          | No                                                               |
| Other Software Dependencies | None                                                             |

## Description

![k3s logo](https://k3s.io/img/logo.svg?1)

Lightweight Kubernetes. Easy to install, half the memory, all in a binary less than 40mb.

Source: [k3s.io](https://k3s.io/)

## Install Notes

Installed using the install script from the `master` branch of the k3s repository.

Also adds an alias to the Condement `dev` user's bash profile so that the standard Kubernetes commands (e.g. `kubectl`) work as expected from the command line. 

### Service Ports

| Service                    | Ports   |
| -------------------------- | ------- |
| Kubernetes Ingress (http)  | 80/tcp  |
| Kubernetes Ingress (https) | 443/tcp |

## Limitations

The alias cause issues for applications which use `which` or manually search for executables on the PATH.
