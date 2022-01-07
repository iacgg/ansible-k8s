$script = <<-'SCRIPT'

apt-get update
apt-get dist-upgrade -y
useradd --shell /bin/bash --create-home sb
usermod -a -G sudo sb
mkdir /home/sb/.ssh
curl -s https://github.com/mrscherrycoke.keys > /home/sb/.ssh/authorized_keys
chown sb:sb /home/sb/.ssh/authorized_keys
chmod 644 /home/sb/.ssh/authorized_keys
echo 'sb ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"
  config.vm.provision "shell", inline: $script

  (201..201).each do |i|
    config.vm.define "haproxy-#{i}" do |haproxy|
    haproxy.vm.network "private_network", ip: "192.168.50.#{i}"
    end
  end

  (101..101).each do |i|
    config.vm.define "init_master-#{i}" do |init_master|
    init_master.vm.network "private_network", ip: "192.168.50.#{i}"
    end
  end

  (102..102).each do |i|
    config.vm.define "more_master-#{i}" do |more_master|
    more_master.vm.network "private_network", ip: "192.168.50.#{i}"
    end
  end

  (10..12).each do |i|
    config.vm.define "worker-#{i}" do |worker|
    worker.vm.network "private_network", ip: "192.168.50.#{i}"
    end
  end

end
