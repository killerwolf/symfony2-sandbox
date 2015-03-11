FROM ansible/ubuntu14.04-ansible
#FROM itech/ansible

MAINTAINER killerwolf

ADD ansible/ /tmp/ansible
ADD application/ /var/www/symfony2-sandbox

#RUN ansible-playbook -i /etc/ansible/hosts --connection=local /tmp/ansible/playbook.local.yml
RUN ansible-playbook -i /etc/ansible/hosts --connection=local /tmp/ansible/playbook.yml

EXPOSE 80
EXPOSE 3306