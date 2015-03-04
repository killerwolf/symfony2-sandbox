#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = true
  config.vm.network :private_network, ip: "192.168.5.111"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.name = "symfony2-sandbox"
  end
  
  config.vm.define "symfony2-sandbox" do |sf2|
  end

  config.vm.hostname = "symfony2-sandbox.dev"
  config.dnsmasq.domain = 'symfony2-sandbox.dev'

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.local.yml"
    ansible.tags = "pre-local"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.limit= "all"
    ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.local.yml"
    ansible.tags = "post-local"
  end
  config.vm.synced_folder "./application", "/var/www/symfony2-sandbox/", :mount_options => [ "dmode=775", "fmode=664" ], :owner => 'www-data', :group => 'vagrant'

  config.dnsmasq.dnsmasqconf = '/usr/local/etc/dnsmasq.conf'
  config.dnsmasq.reload_command = 'sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist; sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist'

end

