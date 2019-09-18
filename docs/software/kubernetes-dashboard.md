# Software - Kubernetes Dashboard

|                             |                                                                                                                                                        |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Condement Software ID       | kubernetes-dashboard                                                                                                                                   |
| Website                     | [kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) |
| License                     | [Apache 2.0](https://github.com/kubernetes/dashboard/blob/master/LICENSE)                                                                              |
| Maintainer                  | [Deosrc](https://github.com/deosrc)                                                                                                                    |
| Persistent Storage          | No                                                                                                                                                     |
| Other Software Dependencies | [k3s](./k3s)                                                                                                                                           |

## Description

![kubernetes logo](https://kubernetes.io/images/nav_logo.svg)

Dashboard is a web-based Kubernetes user interface. You can use Dashboard to
deploy containerized applications to a Kubernetes cluster, troubleshoot your
containerized application, and manage the cluster resources. You can use
Dashboard to get an overview of applications running on your cluster, as well
as for creating or modifying individual Kubernetes resources (such as
Deployments, Jobs, DaemonSets, etc). For example, you can scale a Deployment,
initiate a rolling update, restart a pod or deploy new applications using a
deploy wizard.

Source: [Kubernetes Dashboard Documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

## Install Notes

> &#9888; Dashboard authentication and HTTPS is disabled for ease of use! All actions through the dashboard are done as an administrator an an unencrypted connection!

A desktop shortcut is created for easier access to the dashboard, in addition to adding a hosts file entry so that the dashboard is accessible at [k8s.localtest.me](https://k8s.localtest.me).

## Limitations

None known.
