# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # This box does not include Guest Additions
  # config.vm.box = 'debian/jessie64'
  # Use this box to get Guest Additions 
  config.vm.box = 'evidenceprime/jessie64'

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # You should have checked out the `adapter` repository from
  # https://www.github.com/webrtc/adapter
  if Dir.exist? '../adapter'
    config.vm.synced_folder '../adapter', '/adapter'
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '2048'
  end

  config.vm.provision 'shell',
                      path: 'bootstrap.sh',
                      keep_color: true
end
