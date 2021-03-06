Azure Virtual Network with Automated ELK Stack
=======

The files in this repository were used to configure the network depicted below.

![Azure_Virtual-Network-With-ELK](https://user-images.githubusercontent.com/74498617/114044963-a9012a00-9855-11eb-9582-ed61044a7e29.png)

## Automated ELK Stack Deployment

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

Only the  **Jump Box** and **the ELK** machines can accept connections from the Internet.

- Currently, access to the **Jump Box** is only allowed from my **whitelisted**  public  IP addresses via SSH (port 22) such as my workstation's external IP: **38.88.104.237**
- 
- Access to the  to the **Elk** machine  is allowed access via **TCP protocol on port 5601**  from the **whitelisted**  public  IP addresses such as my workstation's IP: **38.88.104.237** Workstation and **the Jump Box** via SSH port 22 port TCP port: 5601.
- 
- All the **other machines** within the network can only be accessed from **whitelisted** Workstations' IPs** via the **Jump-Box-Provisioner**.

A summary of the access policies in place can be found in the table below.

|     Name    | Publicaly Accessible |              Allowed IP Addresses                     |
|-------------|----------------------|-------------------------------------------------------|
| Jump Box    |     No               | **Whitelisted**, Workstation IP (38.88.104.237)       |
| Webserver 1 |     Yes              | Jump Box  IP: 10.0.0.4 and ELK IP: 10.2.0.4           |
| Webserver 2 |     Yes              | Jump Box  IP: 10.0.0.4 and ELK IP: 10.2.0.4           |
| Webserver 3 |     Yes              | Jump Box  IP: 10.0.0.4 and ELK IP: 10.2.0.4            |
| ELK server  |     No               | Jump Box and **Whitelisted** IP (38.88.104.237)       |

Note: **The machines on the internal network are not exposed to the public Internet. However, 3 DVWA containers on the webserves and the ELKstack container are exposed**.

### Elk Configuration

**Ansible** was used to **automate** configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows us to manage our whole network by simply **updating IaC text files** (usually written in YAML or JSON). Whenever we change a machine's configuration file, Ansible's continuous integration (**CI**) ensures that a new version of that VM is **built quickly** and Ansible's continuous deployment (CD) ensures that this new version of the VM is automatically deployed to our environment. Thus, The main advantage of automating configuration with Ansible is that it enables IT administrators the ability to **automate their daily work tasks** and give the administrator more time to focus on the needs of the business, thus providing more value to the company.

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
The following screenshot displays the result of running **`docker ps`** after successfully configuring the ELK instance.

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

### Summary Instructions for Filebeat Installation on the DVWA Container

- Return to your Ansible VM. Update your playbook with tasks that perform the following:

- Download the filebeat .deb file.

- Use dpkg to install the .deb file.

- Update and copy the provided Filebeat config file.

- Run the filebeat modules enable docker command.

- Run the filebeat setup command.

- Run the filebeat -e command.

- Enable the file service on boot.

- Verify that your play works as expected:

- On the file Installation Page in the ELK server GUI, scroll to Step 5: Module Status and click Check Data.


### Detailed Instructions for Filebeat Installation on the DVWA Container

**Step 1**: Download Filebeat playbook on your DVWA VM.

root@cb323b495752:/etc/ansible# curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > filebeat-config.yml 

**Step 2**: Update  the Filebeat Configuration File and Save this file in /etc/ansible/files/filebeat-config.yml

Once you have this file on your Ansible container, edit it as follows:

Replace the IP address with the IP address of your ELK machine.

- output.elasticsearch:
- hosts: ["10.2.0.4:9200"]
- username: "elastic"
- password: "changeme"
- croll to line #1806 and replace the IP address with the IP address of your ELK machine.
- setup.kibana:
- host: "10.2.0.4:5601"
- 
**Step 3**: Creating the Filebeat Installation Play

On the Ansible VM, create a playbook file, filebeat-playbook.yml.

- Locate this file in your /etc/ansible/roles/ directory.:
- Download the .deb file from artifacts.elastic.co.
- Install the .deb file using the dpkg command dpkg -i filebeat-7.4.0-amd64.deb
- Copy the Filebeat configuration file from your Ansible container to /etc/filebeat/filebeat.yml
- Run the playbook with the command line : _ansible-playbook filebeat-playbook.yml

**Step 4**: Verifying Installation and Playbook

To confirm that the ELK stack is receiving logs from your DVWA machines:
- Navigate back to the Filebeat installation page on the ELK server GUI.
- On the same page, scroll to Step 5: Module Status and click Check Data.
- Scroll to the bottom of the page and click Verify Incoming Data.

### Summary Instructions for Metricbeat Installation on the DVWA Container

- Return to your Ansible VM. Update your playbook with tasks that perform the following:

- Download the Metricbeat .deb file.

- Use dpkg to install the .deb file.

- Update and copy the provided Metricbeat config file.

- Run the metricbeat modules enable docker command.

- Run the metricbeat setup command.

- Run the metricbeat -e command.

- Enable the Metricbeat service on boot.

- Verify that your play works as expected:

- On the Metricbeat Installation Page in the ELK server GUI, scroll to Step 5: Module Status and click Check Data.

### USEFUL COMMANDS (I): Installing and running Containers

The goal of the following instructions/commands is to configure the jump box to run Docker containers and to install a container.

| **Instruction**                                                                         | **Command**                                                                |
|------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| 1. Start by installing docker.io on your Jump box.                                       | sudo apt update then sudo apt install docker.io                           |
| 2. Verify that the Docker service is running.                                            | sudo systemctl status docker                                              |
| 3. Once Docker is installed, pull the container cyberxsecurity/ansible.                  | sudo docker pull cyberxsecurity/ansible.                                  |
| 4. Launch the Ansible container and connect to it.                                       | docker run -ti cyberxsecurity/ansible:latest bash                         |

**Note:** If the Docker service is not running (instruction 2), start it with **sudo systemctl start docker**.


 ### USEFUL COMMANDS (II). Using Ansible Provisioner
 
 **Ansible** is a provioner tool that automatically configure VMs or containers. **Ansible** make it easy to configure potentially thousands of identical machines all at once.
 
**Instructions for launching a VM from the Azure portal that can only be accessed using a SSH key from ansible running inside the jump box.**

1.	Connect to your Ansible container. Once you're connected, create a new SSH key and copy the public key.
2.	Run __sudo docker container list -a__ to find your image.
3.	Run __docker run -it cyberxsecurity/ansible /bin/bash__ to start your container and connect to it. 
4.	Run __ssh-keygen_ to create an SSH key__
5.	Copy your public key string.
6.	Return to the Azure portal and locate one of your Web-1 webserver's details page.
       -	Reset your  Web-1 Vm's password and use your container's __new public key for the SSH user__.
7.	Get the __internal IP__ for your new Web-1 VM from the Details page.
8.	After your VM launches, test your connection using __ssh__  from your jump box Ansible container.
9.	__Exit__ this SSH session by running exit.
10.	Locate the Ansible __config file__ and __hosts__ file by running the command: __ls /etc/ansible/__.
11.	Change the Ansible configuration file to use __your administrator account** for SSH connections__.
13.	Add this machine's __internal IP address__ to the Ansible **hosts** file.
14.	Uncomment the [webservers] header line in the .
15.	Add the internal IP address under the __[webservers]__ header.
16.	Add the python line: __ansible_python_interpreter=/usr/bin/python3 besides each IP__.
Your **host**s file should be similar this: https://github.com/mbrahimi2020/Azure-Virtual-Network_Automated-ELK-Stack/blob/main/Ansible-Files/hosts
17.	Test your connection using ssh from your jump box Ansible container Usin the Command __ansible all -m ping__


### USEFUL COMMANDS (III): Creating an Ansible Playbook

**Instructions for creating an Ansible playbook that installs Docker and configure a VM with the DVWA web app**.

1. Connect to your jump box, and connect to the Ansible container in the box.

     	- docker container list -a
      
      - Start the container again using docker start [container_name]
      
      - Get a shell in your container using docker attach [container_name]

2. Create a YAML playbook file t pentest.yml hat you will use for your configuration.
     Your final playbook should be similar to: https://github.com/mbrahimi2020/Azure-Virtual-Network_Automated-ELK-Stack/blob/main/Ansible-Files/pentest.yml

2. Run your Ansible playbook on the new virtual machine using the command below.

      o	ansible-playbook /etc/ansible/pentest.yml

3. To test that DVWA is running on the new VM, SSH to the new VM from your Ansible container.

      o	SSH to your container: ssh azureuser@10.0.0.11

4. To test the connection. run the following command: 

    o	ansible@Pentest-1:~$ curl localhost/setup.php




<<<<<<< HEAD




=======
>>>>>>> c0b4a110fa699fbf3f8e98138177767b48d5a26a
