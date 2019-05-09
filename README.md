# Condement

Condement (or **Con**tainer **De**velopment Environ**ment**) is intended as a simple way to get a development environment for containers working.

This project was started due to various issues encountered while trying to develop Linux containers using Windows host. The project aims to provide a stable, easy to use development environment for Linux containers allowing developers to spend more time developing and less time setting up and maintaining their environments.

## The Result

The environment can be configured with a simple yaml file but as default you should end up with:

* Ubuntu 18.04 (LTS) with various desktop options:
  * [Xubuntu](https://xubuntu.org/)
  * [Lubuntu](http://lubuntu.me/)
  * [Ubuntu Budgie](https://ubuntubudgie.org/)
* A 'dev' user with sudo (password: 'condement')
* Files persisted to your host machine
* Container Hosting
  * [Docker](https://www.docker.com/)
  * [Kubernetes](https://kubernetes.io/) (via [k3s](http://k3s.io))
    * [Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
* Developer Tools
  * [Visual Studio Code](https://code.visualstudio.com/)
  * [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/what-is?view=sql-server-2017)
* Browsers
  * [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  * [Chromium](https://www.chromium.org/Home)

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

## Advanced

### Sharing your .gitconfig between the host and Condement

#### Symlinking

This is the simplest method but means that files paths likely won't work correctly (i.e. defining the default editor).

1. Enable host_folders persistent storage
2. Move the .gitconfig file from your home directory to the persistent storage folder (`C:\CondementPersistent` by default)
3. Create a symlink from your home directory on the host machine using the command `mklink .gitconfig C:\CondementPersistent\.gitconfig`

#### Including

**Requires git 1.7.10 or higher.**

This method allows you to share only part of your .gitconfig file for better functionality but requires more setup.

1. Enable host_folders persistent storage
2. Move the .gitconfig file from your home directory to the persistent storage folder (`C:\CondementPersistent` by default)
3. Edit the new .gitconfig file in the persistent storage folder to include only the parts you wish to use within Condement.
4. Edit the .gitconfig file in your user home directory to include only the parts removed from the persistent storage version folder.
5. Add the following lines to the bottom of your .gitconfig file:

```ini
[include]
    path = C:/CondementPersistent/.gitconfig
```