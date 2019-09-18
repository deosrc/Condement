# Using Multiple Virtual Machines

Although it is possible to use Condement to create multiple VMs for simultaneous use, it can be confusing to manage.

Multiple VM use is achieved by storing mutliple configuration files and copying the contents into `condement.yaml` when you want to build. To get best results, some guidance is below:

* **Always use distinct hostnames:** Condement uses the hostname for the name of the VM and for some configuraation settings. A unique hostname is the only way to ensure they don't conflict.
* **Always prefix hostnames with "`condement-`":** This ensures you can identify Condement Vms from other VMs.
* **Use the same hostname identifier as the configuration file:** This allows configuration files to be easily identified. If you are storing your configuration files in the resository for easy access, you can use the `condement.*.yaml` format. These files are ignored from the git change history for easier use.
* **Use the `<hostname>` tag if using persistent storage:** Some applications do not react well to other applications changing their files while running. Using the `<hostname>` tag ensures each Condement VM is using a separate persistent storage folder. This will require some additional setup in each VM but will reduce issues.
* **Ensure you have enough resource:** Running multiple VMs consecutively will drastically reduce your available resource. Make sure you don't utilise all of the memory or CPU on your host, otherwise both the VMs and the host may become unstable.
* **Try to keep paths relative to user home:** Using directories relative to `~/` means that you can use the same configuration even if your user account is named differently. This assumes that you have a standard location you use on all of your computers (e.g. `~/repos`). This is also cross-platform so is the same across Linux, Windows and MacOS.

Below is an example of the configuration files I store in my repository:

* `condement_sample.yaml` <- Sample file
* `condement.yaml` <- live file used during build
* `condement.work.yaml` <- for work projects
* `condement.work-<client>.yaml` <- Per client for work
* `condement.personal-worklaptop.yaml` <- For personal projects on work laptop
