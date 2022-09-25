# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_EXPERIMENTAL="disks"

Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"
  config.vm.hostname = "kali.local"
  config.vm.disk :disk, size: "60GB", primary: true
  config.vm.provision "shell", path: "script.sh", privileged: "true"

  config.vm.provider "vmware_workstation" do |v|
    v.gui = true
    v.allowlist_verified = true
    v.vmx["memsize"] = "16384"
    v.vmx["numvcpus"] = "3"
    v.vmx["displayName"] = "kali_bueno_v"
  end

  # config.vm.provider "virtualbox" do |vb|
  #   vb.name = "kali_bueno_v"
  #   vb.memory = "16384"
  #   vb.cpus = 3
  #   vb.gui = true
  # end

end
