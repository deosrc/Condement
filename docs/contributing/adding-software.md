# Contributing - Adding a Software Install Package

## Requirements

In order for software to be included in Condement, it:

* Must have a free option.
  * Feature limited free tiers are fine
  * No time restricted trials (unless they then become feature limited
  free tiers).
* Must have an appropriate license.
  * Must allow automated installation
* Must have a public website and/or source code repository.

If you are contributing a software package, you must also be willing to
maintain it. Keeping all of the install packages working would be a big task
which I don't have time to do (I'm a one man team). If an issue is raised for
your install pacakge, I'll tag you in the ticket. If you don't respond, I
reserve the right to remove the package to prevent it causing issues for more
users.

In terms of the implementation, you must create:

* An Ansible playbook with all of the necessary steps to install the software
* An entries in the relevant configuration files
* A documentation page

The steps to create these will be convered in the next sections.

This may all seem rather strict, but is in place to ensure Condement remains
useful, usable and does not infringe the terms of the licensed software it
uses.

## Selecting a Software ID

Before starting development, you should select a software ID for your package. It should be:

* The name of the software or an accepted common name (e.g. Visual Studio Code is often referred to as VSCode)
* Unique within Condement (check the [software folder](../../software) for existing software IDs)

Once you have selected a software ID, move to the next section.

## Creating the Ansible Playbook

1. Fork the repository and clone to your local machine
2. In the `software` folder, copy the `!template` folder. Set the name of the new folder to the software ID you selected.
3. Open the `playbook.yml` file within the folder and add Ansible tasks to install the required software.

## Testing the Install Package

### Testing Levels

The testing levels defined below are used to establish the amount of testing before submitting a software package.

| Testing Level      | Desktop | Software Packages   |
| ------------------ | ------- | ------------------- |
| Level 1            | All     | Required Only       |
| Level 2            | Xubuntu | Defaults            |
| Level 3            | Xubuntu | All non-conflicting |

#### Level 1

> Level 1 aims to ensure your software install package includes all of the necessary requirements to function correctly and does not cause unintended changes at an OS level.

You should use the [Level 1 testing configuration file](../../test/configurations/condement.level-1.yaml) and modify it to install only your software. You will also need to enter the desktop for each test. **Do not change the resources of the VM.** The software should run in a stable fashion with the configure resources (minimum recommended).

If your software is headless (has no User Interface), you should first test with the desktop set as `"none"`. This will ensure your software has the minimum dependencies.

Software should then be tested with each desktop environment. For each build, you should ensure that the build succeeds, check for unintended actions such as new user accounts at the login screen and ensure the software is working as expected.

#### Level 2

> Level 2 aims to ensure your software works as expected with the default and commonly used software configuration. It also checks persistent storage is working as expected (if included).

You should use the [Level 2 testing configuration file](../../test/configurations/condement.level-2.yaml) and modify it to also install your software. **Do not change the resources of the VM.** The software should run in a stable fashion with the configure resources (minimum recommended).

You should ensure that the build succeeds and check basic functionality of all of the software packages (including the one you added).

#### Level 3

> Level 3 aims to avoid conflicts between software packages.

You should use the [Level 3 testing configuration file](../../test/configurations/condement.level-3.yaml) and modify it to also install your software. For this test, feel free to increase the VM resources to decrease build time.

For this test, you only need to ensure that the build succeeds.

#### Further Testing

The testing levels outlined above are the minimum required for software submission. An additional testing carried out can be specified in the Pull Request. This can include live testing such as "daily use for work".


## Adding Configuration File Entries

An entry to install your software package must be added in two files:

* `condement_sample.yaml`
  * This entry allows the software to be easily discovered by users.
  * The entry here should be commented out so that it is not installed by default. Default software requires more maintenance than other packages due to the larger user base so the decision to have software as default is reserved to the Condement team only.
* `test/configurations/condement.level-3.yaml`
  * This entry ensures your software is tested for compatibility when others are adding new software.

## Creating the Documentation Page

1. In the `docs/software` folder, copy the `!template.md` file and name it `<software-id>.md`.
2. Edit the file as per the instructions within the markdown comments. Keep to
   the headings where possible but if something doesn't fit, create a new section.
3. Commit the change.

## Advanced Features

### Persistent Storage

Persistent storage can be used to save configuration of the software so that it is preserved between rebuild of the machine. An important note here is that this is for "configuration" and not for user files (e.g. documents).

There are two steps to configuring persistent storage in your installer package:

1. Create a folder for the configurationin the configuration directory:

   All of the persistent storage for your software should be stored in `/mnt/persistent_storage/{software-id}/`.

2. Create a link from the configuration directory, to within the persistent storage folder for the software.

   It is recommeneded to create additional directories within the persistent storage folder for the software rather than using the root folder for forwards compatibility (i.e. if the software vendor decides to add another separate folder for configuration, you can just add a folder rather than having to move an existing one). It is also beneficial to keep to the pattern below for easier debugging

   | Software Configuration Directory    | Persistent Storage Folder                           |
   | ----------------------------------- | --------------------------------------------------- |
   | `/home/dev/.{software-name}`        | `/mnt/persistent_storage/{software-id}/user_home`   |
   | `/home/dev/.config/{software-name}` | `/mnt/persistent_storage/{software-id}/user_config` |

An eample of this process is below:

```yaml
- name: Configure persistent storage
  block:
    - name: Create persistent storage directories
      with_items:
      - vscode
      - vscode/user_home
      - vscode/user_config
      file:
        path: "/mnt/persistent_storage/{{item}}"
        state: directory
        owner: dev
        group: dev
  
    - name: Map user home config directory to persistent storage
      file:
        dest: /home/dev/.vscode
        src: /mnt/persistent_storage/vscode/user_home
        state: link
  
    - name: Map user config directory to persistent storage
      file:
        dest: /home/dev/.config/Code
        src: /mnt/persistent_storage/vscode/user_config
        state: link
```

## Submitting the Install Package

