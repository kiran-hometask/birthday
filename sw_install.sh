#!/bin/bash
# Installation of Jenkins, Java and Docker
ansible-galaxy install geerlingguy.jenkins
ansible-galaxy install geerlingguy.docker
ansible-playbook dock_Jen_install.yml
sudo usermod -a -G docker ansible
exit
sudo su ansible
# Creating 3 containers as a service
docker service create --name birthday-svc -p 85:8080 --replicas 3 chakkakiran/birthday
