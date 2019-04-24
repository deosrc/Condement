# Condement

Condement (or **Con**tainer **De**velopment Environ**ment**) is intended as a simple way to get a development environment for containers working.

This project was started due to various issues encountered while trying to develop Linux containers using Windows host. The project aims to provide a stable, easy to use development environment for Linux containers allowing developers to spend more time developing and less time setting up and maintaining their environments.

## The Result

The environment can be configure with a simple yaml file but as default you should end up with:

* Ubuntu 18.04 (LTS) with various desktop options:
  * [Xubuntu](https://xubuntu.org/)
  * [Lubuntu](http://lubuntu.me/)
  * [Ubuntu Budgie](https://ubuntubudgie.org/)
* A 'dev' user with sudo (password: 'condement')
* Files persisted to your host machine
* [Visual Studio Code](https://code.visualstudio.com/)
* [Docker](https://www.docker.com/)
* [Kubernetes](https://kubernetes.io/) (via [k3s](http://k3s.io))
  * [Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Comming soon should also be:

* Git

## Prerequisites

In order to run this, you will need the following installed:

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

## Configuration

A sample configuration file is provided in the root of the repository named [condement_sample.yaml](./condiment_sample.yaml) which include comments of what each configuration setting is for. This should be copied to `condement.yaml` and edited as required.

## Setup Instructions

Setup is easy. Just makes sure you have the [prerequisites](#prerequisites) installed, then do the following:

1. Clone the repository or download the files
2. Copy `condement_sample.yaml` to `condement.yaml` and edit as required.
3. Open a command prompt in the directory
4. Run `vagrant up`

Once the Virtual Machine has finished building, you should be able to log in to the 'dev' account using the Ubuntu Desktop and the password 'condement'.