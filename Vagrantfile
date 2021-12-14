Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"

  (101..101).each do |i|
    config.vm.define "master-#{i}" do |master|
    master.vm.network "private_network", ip: "192.168.50.#{i}"
    master.vm.provision "shell",
        inline: "echo hello from master #{i}"
    end
  end

  (10..12).each do |i|
    config.vm.define "worker-#{i}" do |worker|
    worker.vm.network "private_network", ip: "192.168.50.#{i}"
    worker.vm.provision "shell",
        inline: "echo hello from worker #{i}"
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get dist-upgrade -y
    useradd --shell /bin/bash --create-home sb
    usermod -a -G sudo sb
    mkdir /home/sb/.ssh
    curl -s https://github.com/mrscherrycoke.keys > /home/sb/.ssh/authorized_keys
    chown sb:sb /home/sb/.ssh/authorized_keys
    chmod 644 /home/sb/.ssh/authorized_keys
    echo 'sb ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
  SHELL
end
