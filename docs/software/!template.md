# Software - {software-name}

<!--
Fill in the summary table for the software.

The {software-version} should be the version identifier of the software package
which is installed. Where possible, the latest stable version number should be
hard coded to ensure consistency across environments. If this is not possible,
you can use the latest available stable version. If this is the case, use "latest"
instead of the version number in the documentation table.

The {software-id} should be a unique string to identify the software package
within Condement. This is used in a number of places such as the Ansible folder
name and persistent storage folder name.

The website should show the URL of the site without the protocol prefix. Https
links should be used where possible. If the software does not have a website, a
link to the repository may be used instead. Software without a website or
public repository will not be accepted.

The license should be a link directly to the software website where possible.

The maintainer should be your own github username and a link to your profile.
This is so that you can be contacted in the event of any issues with the
software install. Software installs which are not maintained may be removed.

Persistent storage indicates if a persistent storage folder is configured so
that settings of the software are preserved across rebuilds.

Other software dependencies should list any other software install packages
which are required for this software to work correctly. For example, the
Kubernetes Dashboard software requires k8s to be enabled in order to work
correctly. This lets users know that the software must be enabled and likely
must be specified first in the software list.
-->

|                             |                                |
| --------------------------- | ------------------------------ |
| Version                     | {software-version}             |
| Condement Software ID       | {software-id}                  |
| Website                     | {software-website}             |
| License                     | {link-to-license}              |
| Maintainer                  | {github-account-of-maintainer} |
| Persistent Storage          | Yes/No                         |
| Other Software Dependencies | {condement-software-links}     |

## Description

<!--
Include a brief description of the software and what it is used for.
This can usually be retrieved from the website for the software.
-->

## Install Notes

<!--
Include any special notes about the install. For example, the golang software
package also installs a number of go packages which are used by the VSCode
golang extension order to reduce the time to configure the machine.
-->

### Service Ports

<!--
List any services which the software package installs. This should be in the format <port>/<protocol> (e.g. 80/tcp for
HTTP). If the service does not expose any services, this section can be removed.
-->

| Service | Ports |
| ------- | ----- |
|         |       |

## Limitations

<!--
Any limitations on usability of the software due to how it is installed should
be listed here.
-->
