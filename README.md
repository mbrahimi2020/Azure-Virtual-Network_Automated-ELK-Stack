Azure Virtual Network with Automated ELK Stack
=======

The files in this repository were used to configure the network depicted below.

## Automated ELK Stack Deployment
![Azure_Virtual-Network-With-ELK](https://user-images.githubusercontent.com/74498617/113628830-7c6dc800-9633-11eb-8a68-057ae34fb238.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **yml** and **config** file may be used to install only certain pieces of it, such as Filebeat.

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

Machines within the network can only be accessed by **Workstation** via **Jump-Box-Provisioner**.

Which machine did you allow to access your ELK VM? What was its IP address?
- **The Jump BOx with IP: 10.0.0.4 via SSH port 22** 
- **Workstation with Public IP via port TCP 5601**

A summary of the access policies in place can be found in the table below.

| Name        | Publicaly Accessible | Allowed IP Addresses                                |
|-------------|----------------------|-----------------------------------------------------|
| Jump Box    | No                   | White listed, Workstation Public IP (38.88.104.237) |
| Webserver 1 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| Webserver 2 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| Webserver 3 | Yes                  | Any, Jump Box  IP: 10.0.0.4  via SSH on port 22     |
| ELK server  | NO                   | White listed, Workstation Public IP TCP port 5601   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows us to manage our whole network by simply **updating IaC text files** (usually written in YAML or JSON). Whenever we change a machine's configuration file, Ansible's continuous integration (**CI**) ensures that a new version of that VM is **built quickly**. Ansible's continuous deployment (CD) ensures that this new version of the VM is automatically deployed to our environment.

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
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance. ![](C:\Users\Mammar\Documents\Azure_Virtual-Network_With-ELK\Images\VM hosting the ELK server-screenshot\VM-hosting-ELK-server.png)
(C:\Users\Mammar\Documents\Azure_Virtual-Network_With-ELK\Images\VM hosting the ELK server-screenshot\Web-1.png) 
(C:\Users\Mammar\Documents\Azure_Virtual-Network_With-ELK\Images\VM hosting the ELK server-screenshot\Web-2.png)  
(C:\Users\Mammar\Documents\Azure_Virtual-Network_With-ELK\Images\VM hosting the ELK server-screenshot\Web-3.png) 

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
 - Webserver 1 : 10.0.0.11
 - Webserver 2 : 10.0.0.12
 - Webserver 3 : 10.0.0.13

We have installed the following Beats on these machines: 
 - ELK Server, Webserver 1, Webserver 2 and Webserver 3
 - The ELK Stack Installed are: **FileBeat and MetricBeat**

These Beats allow us to collect the following information from each machine:
 - 
 **Filebeat** watch for and monitors **log events**. Filebeat  reads system application log files from the web servers, then ship them  to a central Logstash or Elasticsearch for **analysis and indexing**. 

**Metricbeat** is used to collect **machine metrics** such as uptime from servers and systems,then ship them  to a central Logstash or Elasticsearch for **analysis**.
 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

For ELK VM Configuration: 
- Copy the [Ansible ELK Installation and VM Configuration ](https://github.com/mbrahimi2020/Azure-Virtual-Network_with-ELK/ /master/Ansible/ELK_Stack/install-elk.yml)
- Run the playbook using this command :  `ansible-playbook install-elk.yml`
<<<<<<< HEAD




=======
>>>>>>> c0b4a110fa699fbf3f8e98138177767b48d5a26a
