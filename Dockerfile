FROM ansible/ubuntu14.04-ansible
#FROM itech/ansible

MAINTAINER killerwolf

RUN ansible-playbook -i /etc/ansible/hosts --connection=local ansible/playbook.local.yml
RUN ansible-playbook -i /etc/ansible/hosts --connection=local ansible/playbook.yml

EXPOSE 80
EXPOSE 3306