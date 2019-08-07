# Using the Virtual Machine

## Logging In and Sudo

To log in to the VM, use the credentials below. This password can also be used when sudo is required for commands.

| Username | Password  |
| -------- | --------- |
| dev      | condement |

> **NOTE:** For most desktops, the login screen will default to the "Ubuntu" user. This account is only used for
> configuration and cannot be used. After first login, desktops will usually default to the last used user account.

## Adding Host Folders

> **NOTE:** This is a manual process. Invalid configuration can cause the VM to fail when booting. It is recommended to
> ensure all user files are stored in host folders before performing these steps.

Unfortunately, adding a host folder to an existing machine cannot currently be done through Condement due to limitations
in how the host folders are created. As it may take longer than is desirable to rebuild the VM, the instructions below
are provided in order to add the folder manually. This will need to be done while the VM is running.

1. Create the host_folder in the Condement configuration file as normal. This will ensure it is created if the VM is
rebuilt, and will be used as a basis for determining the settings in these steps.
2. Open the VirtualBox settings for the VM and go to shared folders.
3. Click the ![Add Share](images/virtualbox-add-share.png) button.
4. Enter the following settings:
    * Folder Path: `<condement-host-folder-source>`
    * Folder Name: `<condement-host-folder-name>`
5. Leave the "Read-only", "Auto-mount" and "Mount point" settings as the defaults and click OK.
6. In the VM, open the `/etc/fstab` file in an editor (you will need sudo for this!)

    ```bash
    sudo nano /etc/fstab
    ```

7. Add the following line to the bottom of the file (you may want to prepare this in a text editor first):

    ```text
    <condement-host-folder-name>    <condement-host-folder-target>    vboxsf    defaults,umask=022,uid=1002,gid=1002    0    0
    ```

8. Save the file (`Ctrl + X` if you are using nano).
9. Run the following the mount the new share:

    ```bash
    sudo mount -a
    ```

10. (Optional) Reboot the VM to ensure the mount works correctly on startup.

## Adding Software

New software can be added to an existing VM using the same process as initially building the VM, however, the VM will be
rebooted so that it can attach the necessary resources. **This must be done via Vagrant as below.**

1. Edit the Condement configuration file to add the required software. If you want to speed up the installation, you can
remove all other software from the list. Any previously installed software will still be present on the VM after the
build.
2. Run the following command from the host to reboot the VM:

    ```text
    vagrant reload
    ```

   Once restarted, the software will be installed. You can usually login and continuing using the VM while the software
   is being installed.