# Connecting via Remote Desktop

## Introduction

The VirtualBox user interface provides the ability to connect to the desktop of a Virtual Machine (VM), however, there
are some annoyances with using this. As an alternative, VirtualBox and Condement allow the use of a Remote Desktop
Connection to interact with the VM.

The instructions below show how to connect the Remote Desktop client built in to Windows, however, clients are also
available for Linux, Mac and even mobile platforms. Provided that the client supports the Microsoft RDP protocol, it
should work with Condement.

## Connecting to the VM

1. Ensure that the `rdp_port` settings is defined in the Condement configuration file and that the VM has been rebuilt.
2. Open "Remote Desktop Connection" from the start menu.
3. Enter `localhost:<rdp_port>` into the computer name field, replacing `<rdp_port>` with the port number from the
   Condement configuration file.

   ![remote desktop connection dialog](./images/rdp_connection_dialog.png)
4. Click connect, if you receive the following warning, click "Yes". This is caused by VirtualBox using an older version
   of the RDP protocol and is usual when connecting to a non-Windows Operating System.

   ![remote desktop identity warning](./images/rdp_identity_warning.png)

You should now be connected to the Condement VM and can login and interact with it as usual.

## Troubleshooting

### The connection fails or is already in use

![remote desktop already in use](./images/rdp_already_in_use.png)

A connection failure is unlikely given we are connecting to the current machine. Instead, a connection failure will
usually mean that VirtualBox could not start the service on the specified port. This is usually because it is already in
use. To resolve this, simply change the port number to an unused port. To avoid rebuilding the VM, this can be done in
the VirtualBox settings in the "Display" page under the "Remote Desktop" tab.
