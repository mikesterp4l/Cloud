## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/mikesterp4l/Cloud/blob/main/Diagrams/With%20ELK%20Red-Team%20Azure%20Architecture.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml https://github.com/mikesterp4l/Cloud/blob/main/Ansible/Install-ELK.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
-The Load Balancer Will distribute the incoming traffic evenly across our three VM's.This will help mitigate DoS attacks thus allowing for our availability to be present.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the event logs and system metrics.
Filebeat collects data about the file system.
Metricbeat collects metrics from OS and Services.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.4   | Linux          |
| WEB-1    | Web Server | 10.0.0.12  | Linux          |
| WEB-2    | Web Server | 10.0.0.11  | Linux          |
| WEB-3    | Web Server | 10.0.0.13  | Linux          |
| ELK-VM   | ELK Server | 10.1.0.4   | Linux          |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Add whitelisted IP addresses: (Personal IP address)

Machines within the network can only be accessed by Jumpbox-Provisioner through docker.
Jumpbox-Provisioner 10.0.0.4 and My Personal Machine (My Personal Machine IP Address) can connect to kibana on port 5601

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes            | PERSONAL |
| Web-1    | No             | 10.0.0.4 |
| Web-2    | No             | 10.0.0.4 |
| Web-3    | No             | 10.0.0.4 |
| ELK-VM   | Yes            | 10.0.0.4, 10.0.0.12, 10.0.0.11, 10.0.0.13, INTERNET |
| Load Balanacer | yes      | OPEN     | 
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
Using Ansible to automate configuration on the ELK machine is very advantageous because you can implement changes across all machines in a network instead of doing the changes manually one by one.

The playbook implements the following tasks:
- Increase the Virtual Memory
- Commands the system to Use More Memory
- Installs & Enables Docker
- Installs Python & Enables Docker Module
- Runs ELK Stack Docker Container on Reboot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/mikesterp4l/Cloud/blob/main/Diagrams/sudo_docker_ps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.12
- Web-2 10.0.0.11
- Web-3 10.0.0.13

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeats helps generate and organize log files to send to Logstash and Elasticsearch. Specifically, it logs information about the file system, including which files have changed and when. EX: type: log path: /var/log/messages /var/log/*.log

Metricbeat collect metrics from the OS and servers. Metricbeat than sends the metrics to Logstash and Elasticsearch. Ex: Functionbeat collects logs file from the cloud environment and sends it to the ELK stack.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/ while you are in the ansible container.
- Update the install-elk.yml file to include... which hosts you want the playbook to effect.
- Run the playbook, and navigate to [Your_ELK_Server_IP:5601] to check that the installation worked as expected.

- The playbook install-elk.yml and copy to /etc/ansible directory.
- You have to Edit the hosts file which is located in /etc/ansible/hosts. When you're editing the files you can add the VM's: ELK server IP address and web-1, web-2, web-3 addresses. You can create groups for which VM you want to install both of the Beats on.
- http://[Your_ELK_SERVER_IP:5601]/app/kibana, Then you want to go to filebeat/metricbeat page and go to the bottom were step 5 is at. Next click the 'Check Data' to make sure the data was recieved successfully
