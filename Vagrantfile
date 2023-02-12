Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian11"

  config.vm.box_check_update = true

  config.vm.network "public_network", use_dhcp_assigned_default_route: true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus  = 1
    vb.memory = "2048"
  end

  # config.vm.provision "shell", path: "bootstrap.sh"

end
