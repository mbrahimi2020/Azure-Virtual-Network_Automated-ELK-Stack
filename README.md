Azure Virtual Network with Automated ELK Stack
=======

The files in this repository were used to configure the network depicted below.

## Automated ELK Stack Deployment
![Azure_Virtual-Network-With-ELK](https://user-images.githubusercontent.com/74498617/113628830-7c6dc800-9633-11eb-8a68-057ae34fb238.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **.yml** file may be used to install only certain pieces of it, such as **filebeat-playbook.yml** for Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **available**, in addition to restricting **traffic** to the network. 

- What aspect of security do load balancers protect? 
  
 **Load balancers** ensure **availability**, **web security** and balance **web traffic** across multiple servers. For example, load balancers protect the system from DDoS attacks by shifting traffic. 

- What is the advantage of a jump box? 
  
  As shown in the diagram above, a **jump box** is essentially identical to a gateway router. Placing the jump box between VMs on a network forces all traffic through a single node
  The advantage of a jumbox are:

  - **Access Control**
  - **Automation**
  - **Security**
  - **Network Segmentation**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **data** and system **logs**.

- What does Filebeat watch for?

 **Filebeat** watch for and monitors **log events**. Filebeat  reads system application log files from the web servers, then ship them  to a central Logstash or Elasticsearch for **analysis and indexing**. 
 
- What does Metricbeat record? 

**Metricbeat** is used to collect **machine metrics** such as uptime from servers and systems,then ship them  to a central Logstash or Elasticsearch for **analysis**. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name         | Function       | IP Address                       | Operating System |
|--------------|----------------|----------------------------------|------------------|
| Jump Box     | Gateway        | 10.0.0.4 /40.121.20.56           | Linux/Ubuntu     |
| Web Server 1 | Webserver      | 10.0.0.11                        | Linux/Ubuntu     |
| Web Server 2 | Webserver      | 10.0.0.12                        | Linux/Ubuntu     |
| Web Server 3 | Webserver      | 10.0.0.13                        | Linux/Ubuntu     |
| RedTeam-LB   | Load Balancer  | 40.76.32.35                      | Linux/Ubuntu     |
| ELK Server   | Elk Stack      | 10.2.0.4/52.250.60.72            | Linux/Ubuntu     |
| Workstation  | Access Control | Workstation Public address       | Windows/Linux    |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **Elk** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 
- **Workstation with Public IP  via TCP protocol on port 5601.**

Machines within the network can only be accessed from **Workstation** via **Jump-Box-Provisioner**.

Which machine did you allow to access your ELK VM? What was its IP address?
- **The Jump BOx with IP: 10.0.0.4 via SSH port 22 port TCP 5601** 
- **Workstation with Public IP via SSH port 22port TCP 5601**

A summary of the access policies in place can be found in the table below.

| Name        | Publicaly Accessible | Allowed IP Addresses                                |
|-------------|----------------------|-----------------------------------------------------|
| Jump Box    | No                   | White listed, Workstation Public IP (38.88.104.237) |
| Webserver 1 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| Webserver 2 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| Webserver 3 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| ELK server  | NO                   | White listed, Workstation Public IP TCP port 5601   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows us to manage our whole network by simply **updating IaC text files** (usually written in YAML or JSON). Whenever we change a machine's configuration file, Ansible's continuous integration (**CI**) ensures that a new version of that VM is **built quickly**. Ansible's continuous deployment (CD) ensures that this new version of the VM is automatically deployed to our environment. Thus, The main advantage of automating configuration with Ansible is that it enables IT administrators the ability to **automate your daily work tasks** and give the administrator more time to focus on the needs of the business, thus providing more value to the company.

The playbook implements the following tasks: (for more details visit (https://github.com/mbrahimi2020/Azure-Virtual-Network_with-ELK/ /master/Ansible/ELK_Stack/install-elk.yml)

- Configue the ELK VM with Docker and specify the remote user (azureuser)
      - hosts: elk
      - remote_user: Azureuser

- Increase System Memory 
    
- Install the following services:
       - docker.io
       - python3-pip, and
       - Install Docker python module

- Increase virtual memory

- download and launch a docker elk container on these published port
  for Kibana (5601), Elasticsearh (9200) and Filebeats/Logstash (5044)

     `5601:5601` 
     `9200:9200`
     `5044:5044`
    ```
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![VM-hosting-ELK-server](https://user-images.githubusercontent.com/74498617/113654521-05055c00-9666-11eb-8540-01903df80161.png)

![VM-hosting-ELK-server](https://user-images.githubusercontent.com/74498617/113654561-19e1ef80-9666-11eb-90bc-be8b58ed2f16.png

![docker-ps-web-1](https://user-images.githubusercontent.com/74498617/113654527-09317980-9666-11eb-8c4b-cf14ebf7bdc7.png)

![docker-ps-web-2](https://user-images.githubusercontent.com/74498617/113654544-10f11e00-9666-11eb-881c-deb2690b5fce.png)

![docker-ps-web-3](https://user-images.githubusercontent.com/74498617/113654560-19e1ef80-9666-11eb-8278-fb2097b46224.png)

                    Note: click on the image to enlarge it.

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
 - Webserver 1 : 10.0.0.11
 - Webserver 2 : 10.0.0.12
 - Webserver 3 : 10.0.0.13

We have installed the following Beats on these machines: 
 - ELK Server, Webserver 1, Webserver 2 and Webserver 3
 - The ELK Stack Installed are: **FileBeat and MetricBeat**

 **These Beats allow us to collect the following information from each machine:**
 
 **Filebeat** watch for and monitors **log events**. Filebeat  reads system application log files from the web servers, then ship them  to a central Logstash or Elasticsearch for **analysis and indexing**. 

**Metricbeat** is used to collect **machine metrics** such as uptime from servers and systems,then ship them  to a central Logstash or Elasticsearch for **analysis**.
 
 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

-  Copy the **install-elk.yml** file to **ansible container: /etc/ansible**.
- Update the **hosts file** to include **the correct IP addresses for the ELK server and webservers**
- Run the playbook **ansible-playbook install-elk.yml**, and navigate to ** http://X.X.X.X:5601/app/kibana** to check that the installation worked as expected.

**Note**: In this project navigate http://52.250.60.72:5601/app/kibana 

**The specific commands the user will need to run to download the playbook, update the files, etc...**

**FILEBEAT:**

- Download Filebeat playbook usng this command:
curl -L -O https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml

- Copy the filebeat-config.yml  to the Directory: /etc/filebeat/filebeat-playbook.yml

- Download the .deb file from artifacts.elastic.co.
  curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb
  
- Install the .deb file using the dpkg command: dpkg -i filebeat-7.4.0-amd64.deb

- Update the filebeat-playbook.yml file 

- Update the filebeat-config.yml file 
   _root@cb323b495752:/etc/ansible# cd files_
   _root@cb323b495752:/etc/ansible/files# ls_
   _filebeat-config.yml  metricbeat-config.yml_
   _root@cb323b495752:/etc/ansible/files# **nano filebeat-config.yml**_
   
- Run the playbook with the command line : _ansible-playbook filebeat-playbook.yml._ 

- Navigate to Kibana to check that the installation worked as expected.

**METRICBEAT:**

- Download Metricbeat playbook using thecommand:
curl -L -O https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-config.yml

- Copy the /etc/ansible/files/metricbeat file to /etc/metricbeat/metricbeat-playbook.yml

- Update the filebeat-playbook.yml file to include installer
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb

- Update the metricbeat configuration file:
    _root@cb323b495752:/etc/ansible# cd files_
   _root@cb323b495752:/etc/ansible/files# ls_
   _filebeat-config.yml  metricbeat-config.yml_
   _root@cb323b495752:/etc/ansible/files# **nano metricbeat-config.yml**_
   
- Run the command _ansible-playbook metricbeat-playbook.yml_

- Navigate to Kibana to check that the installation worked as expected.



<<<<<<< HEAD




=======
>>>>>>> c0b4a110fa699fbf3f8e98138177767b48d5a26a
