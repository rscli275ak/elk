# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    etcHosts = ""

    config.vm.box = "ubuntu/bionic64"
    config.vm.box_url = "ubuntu/bionic64"

    NODES = [
        { :hostname => 'elk', :ip => "192.168.20.102", :cpus => 4, :mem => 4096, :type => "elk" },
        { :hostname => 'srv1', :ip => "192.168.20.103", :cpus => 1, :mem => 512, :type => "srv" },
        { :hostname => 'srv2', :ip => "192.168.20.104", :cpus => 1, :mem => 512, :type => "srv" },
    ]

    # Complete /etc/hosts file for each node
    
    NODES.each do |node|
        etcHosts += "echo '" + node[:ip] + "    " + node[:hostname] + "' >> /etc/hosts" + "\n"
    end #end NODES
    
    NODES.each do |node|
        config.vm.define node[:hostname] do |node_config|
            node_config.vm.hostname = node[:hostname]
            node_config.vm.network "private_network", ip: node[:ip]
            node_config.vm.provider "virtualbox" do |v|
                v.customize ["modifyvm", :id, "--cpus", node[:cpus] ]
                v.customize ["modifyvm", :id, "--memory", node[:mem] ]
                v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
                v.customize ["modifyvm", :id, "--name", node[:hostname] ]
            end # end provider

            # Update /etc/hosts and common script for all
            node_config.vm.provision :shell, :inline => etcHosts
            node_config.vm.provision :shell, :path => 'install_common.sh'

            # Install ELK stack
            if node[:type] == "elk"
                node_config.vm.provision :shell, :path => 'install_elk.sh'
                node_config.vm.synced_folder "share/", "/home/vagrant/share"
            end
            
        end #end config
    end #end NODES
end #end Vagrant