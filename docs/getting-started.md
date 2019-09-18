# Getting Started

## Installing the Prerequisites

To run Condement, you will need to ensure you have installed:

* [VirtualBox](https://www.virtualbox.org/) (Tested with version 6.0.4)
* [Vagrant](https://www.vagrantup.com/) (Tested with version 2.2.3)

For best compatibility, it is also advised to install the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads).

## Recommended Specifications

It is recommended to assign to a Condement VM at least:

* 2GB Memory
* 2 CPUs
* 128MB Video Memory

It may be possible to run on lower settings but this is not recommended. 

For running a single Condement VM with the above specifications, it is recommended to have on the host as a minimum:

* 4GB Memory
* 4 CPU Cores

> These are minimum specifications. Higher specifications are recommended.

## Basic Configuration

In order to get started, we are going to use the sample configuration this should run on most machines:

1. Clone the repository to your machine.
2. Copy the `condement_sample.yaml` file and name it `condemenet.yaml`.
3. If you chose not to install the VirtualBox Extension Pack, you may need to change `video_3d_acceleration` to `false`.
4. Create the following folders in you user home directory (e.g. `C:\Users\MyUser\` on windows or `/home/myuser/` on Linux/Mac OS):
    * `Repos` - This can be used to store git repositories.
    * `CondementPersistent` - This is used to store software settings so that they are not lost if the VM is rebuilt.

## Building the VM

Now that the configuration is in place, you can start building the VM by opening a command prompt or shell in the
repository directory and running the following:

```shell
vagrant up
```

This will begin building the VM which will take approximately 15 minutes (depending on your system specifications). At
the end of the build process, the VM will reboot into the desktop environment.
