#!/bin/bash

echo "This will load the 3 ansible playbooks"

#elk needs to load first as the filebeat install will fail if the server is not online this machine needs to be specifid in the hosts file.
echo "Starting Elk Stack"
#starting Elk Stack
ansible-playbook install-elk.yml

# install the DVWA webservers on machines specified as webservers in the host file
echo "Starting DVWA servers"
ansible-playbook ansible_config.yml


# Pause for user check to make sure Kibana has started
echo "Press any key after you have confirmed that Kibana has started"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
fi
done


#installs filebeat on webserver machines
ansible-playbook filebeat-playbook.yml

echo " "
echo "All playbooks loaded"

