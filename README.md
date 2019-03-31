# Condement

Condement (or **Con**tainer **De**velopment Environ**ment**) is intended as a simple way to get a development environment for containers working.

This project was started due to various issues encountered while trying to develop Linux containers using Windows host. The project aims to provide a stable, easy to use development environment for Linux containers allowing developers to spend more time developing and less time setting up and maintaining their environments.

## The Result

The environment can be configure with a simple yaml file but as default you should end up with:

* Ubuntu 18.04 (LTS)
* A 'dev' user with sudo (password: 'condement')
* Visual Studio Code
* Docker

Comming soon should also be:

* Files persisted to your host machine
* Git
* Kubernetes (via [k3s](http://k3s.io))
* Kubernetes Dashboard

## Prerequisites

In order to run this, you will need the following installed:

* VirtualBox
* Vagrant

## Configuration

A sample configuration file is provided in the root of the repository named [condement_sample.yaml](./condiment_sample.yaml). The configuration options are documented below:

| Option | Description |
|---|---|
| `cpus` | The number of virtual CPUs to configure on the Virtual Machine. This should be equal to or less than the number of CPU cores on your host. |
| `memory_mb` | The amount of memory to attach to the Virtual Machine in Megabytes. This should be less than the amount of free memory on your host machine otherwise you will encounter performance issues. |
| `video_memory_mb` | The amount of video memory to assign to the Virtual machine in Megabytes. This should be between 1 and 128. |
| `video_3d_acceleration` | Determines if 3 video acceleration should be enabled. |
| `keyboard_layout` | The puppet file within [keyboard_layouts](./keyboard_layouts) to apply for the keyboard layout. |
| `hostname` | The hostname of the virtual machine. |
| `show_gui` | Determines if VirtualBox should show the Virtual Machine display once it is created. |
| `host_work_dir` | The path to a directory on the host which is mounted to the `/mnt/work` directory in the Virtual Machine (not currently working). |
| `puppet_files_to_apply` | The names of the puppet files to apply to the Virtual Machine for various features. The items in this list should match the file names in the [puppet directory](./puppet). |

## Setup Instructions

Setup is easy. Just makes sure you have the [prerequisites](#prerequisites) installed, then do the following:

1. Clone the repository or download the files
2. Open a command prompt to the directory
3. Run `vagrant up`

Once the Virtual Machine has finished building, you should be able to log in to the 'dev' account using the Ubuntu Desktop and the password 'condement'.