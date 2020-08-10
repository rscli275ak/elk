#!/bin/bash

echo "TASK - Install Common"
sudo apt install -y install vim tree net-tools telnet git python3
sudo echo "autocmd filetype yaml setlocal ai ts=2 sw=2 et" > /home/vagrant/.vimrc
sudo echo "alias python=/usr/bin/python3" >> /home/vagrant/.bashrc
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
sudo service docker start
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd