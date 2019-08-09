#!/bin/bash
# Installation of Jenkins, Java and Docker
ansible-galaxy install geerlingguy.jenkins
ansible-galaxy install geerlingguy.docker
export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook /home/ansible/birthday/dock_Jen_install.yml
# Creating 3 containers as a service
sudo docker swarm init
sudo docker service create --name birthday-svc1 -p 90:8080 --replicas 3 chakkakiran/birthday
