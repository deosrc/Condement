require 'yaml'
require 'fileutils'

if (!File.file?('./condement.yaml')) then
    raise "Configuration file '" + File.expand_path('./condement.yaml') + "' does not exist. To get started, create and modify a copy of condement_sample.yaml"
end
condement_config = YAML.load_file('./condement.yaml')

this_condement_version = 0.4

if (condement_config['condement_version'] == nil) then
    raise 'condement_version must be specified'
elsif (condement_config['condement_version'] > this_condement_version) then
    raise "Condement file is for version #{condement_config['condement_version']} but installed version is #{this_condement_version}. To use this configuration file, you will need to upgrade condement."
end

Vagrant.configure(2) do |config|
    config.vm.define condement_config['os']['hostname'] do |server|
        server.vm.box = "ubuntu/bionic64"
        server.vm.hostname = condement_config['os']['hostname']

        server.vm.provider :virtualbox do |v|
            # Configure basic VM settings
            v.name = condement_config['os']['hostname']
            v.gui = condement_config['show_gui']

            # Configure resources available to the VM
            v.cpus = condement_config['resource']['cpus']
            v.memory = condement_config['resource']['memory_mb']

            # Configure clipboard and drag and drop for ease of use
            v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
            v.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

            # Configure the display
            accelerate3d = 'off'
            if (condement_config['resource']['video_3d_acceleration']) then
                accelerate3d = 'on'
            end

            v.customize ['modifyvm', :id, '--accelerate3d', accelerate3d]
            v.customize ['modifyvm', :id, '--vram', condement_config['resource']['video_memory_mb']]
            v.customize ['modifyvm', :id, '--monitorcount', condement_config['resource']['monitor_count']]

            # Configure each host_folder as a permanent share
            if (condement_config['host_folders'] != nil) then
                condement_config['host_folders'].each do |folder_name, folder|
                    if (folder['source'] == nil) then
                        raise "Source is required for host_folder #{folder_name}"
                    end
                    if (folder['target'] == nil) then
                        raise "Target is required for host_folder #{folder_name}"
                    end

                    absolute_path = File.expand_path(folder['source']) || ""

                    if (folder_name == 'persistent_storage') then
                        absolute_path.gsub! '<hostname>', condement_config['os']['hostname']
                        FileUtils.mkdir_p absolute_path
                    end

                    if (!File.directory?(absolute_path)) then
                        raise "Directory '" + absolute_path + "' does not exist on the host."
                    end

                    v.customize ['sharedfolder', 'add', :id, '--name', folder_name, '--hostpath', absolute_path]
                end
            end
        end

        # Forward any specified ports
        if (condement_config['forwarded_ports'] != nil) then
            condement_config['forwarded_ports'].each do |service_name, port_forward|
                if (port_forward['protocol'] = nil) then
                    port_forward['protocol'] = "tcp"
                end

                config.vm.network 'forwarded_port', guest: port_forward['vm_port'], host: port_forward['host_port'], protocol: port_forward['protocol']
            end
        end

        # Build the Ansible payload
        config.vm.provision 'shell', path: './system/build_ansible_payload.sh', run: 'always'

        # Run Ansible
        config.vm.provision 'ansible_local', run: "always" do |ansible|
            ansible.playbook = './.condement/site.yaml'
            ansible.config_file = './system/ansible.cfg'
            ansible.extra_vars = './condement.yaml'
        end

        # Start the desktop
        config.vm.provision "shell", inline: "reboot"
    end
end
