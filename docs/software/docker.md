# Software - Docker

|                             |                                                                               |
| --------------------------- | ----------------------------------------------------------------------------- |
| Condement Software ID       | `docker`                                                                      |
| Website                     | [www.docker.com/](https://www.docker.com/)                                    |
| License                     | &#9888; Mostly [Apache 2.0](https://www.docker.com/legal/components-licenses) |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                                           |
| Persistent Storage          | Yes                                                                           |
| Other Software Dependencies | None                                                                          |

## Description

Docker is a set of coupled software-as-a-service and platform-as-a-service products that use operating-system-level virtualization to develop and deliver software in packages called containers.

Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels.[9] All containers are run by a single operating-system kernel and are thus more lightweight than virtual machines. Containers are created from images that specify their precise contents. Images are often created by combining and modifying standard images downloaded from public repositories.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Docker_%28software%29)

## Install Notes

Includes:

* Docker Community Edition Runtime
* Docker Community Edition CLI
* Docker Compose

Condement `dev` user is added to `docker` group to allow use of CLI to local runtime without sudo.

Persistent storage is configured so that credentials to docker registries are persisted.

## Limitations

None known.
