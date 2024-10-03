#!bin/bash
dnf install ansible -y
cd /tmp
git clone https://github.com/silpa06/expense-ansible.git
cd expense-ansible
ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini fronrend.yaml

