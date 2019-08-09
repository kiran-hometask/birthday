#!/bin/bash
# Installation of Ansible on Linux servers

if [ -f /etc/centos-release ] || [ -f /etc/redhat-release ] || [ -f /etc/oracle-release ] || [ -f /etc/system-release ] || grep -q 'Amazon Linux' /etc/system-release; then

# installing Ansible on Centos/redhat/orace/amazon linux servers
sudo yum install epel-release -y
sudo yum install ansible -y
sudo yum install sshpass -y

elif [ -f /etc/debian_version ] || [ grep -qi ubuntu /etc/lsb-release ] || grep -qi ubuntu /etc/os-release; then

# installing Ansible on Debian/Ubuntu linux servers
echo "updating OS package"
sudo apt update
sudo apt-get install sshpass -y

echo "software-properties-common package installation"
sudo apt install software-properties-common -y

echo "Adding the Ansible PPA"
sudo apt-add-repository --yes --update ppa:ansible/ansible

echo"Install the Ansible software"
sudo apt install ansible -y

fi

#python version
python --version

#Ansible version
ansible --version

#adding localhost in the host file
sudo chmod 777 /etc/ansible/hosts
sleep 10s
echo "localhost" > /etc/ansible/hosts

#generate ssh keys
ssh-keygen -t rsa -f /home/ansible/.ssh/id_rsa -q -P ""

#copy the id file into same machine
cd /home/ansible/.ssh/
sshpass -p "ansible" ssh-copy-id -o StrictHostKeyChecking=no ansible@localhost

echo "Anible Installation completed"

sh /home/ansible/birthday/sw_install.sh
