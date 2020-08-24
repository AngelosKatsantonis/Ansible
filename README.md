# easy-server
Collection of ansible playbooks roles and various scripts to launch and configure aws instances (Debian)

# Setup
Requires Ansible to be installed and configured (Sample installation script included under scripts)

Move the contents of this repo under /etc/ansible

# Content
Included roles:
* copy_key: Uses copy module to copy a key or certificate from src(local) to dest(remote) with correct access rights
* launch_ec2_instance: Starts a new ec2 instance on AWS from local host
* setup_ansible: Install and configure ansible on target instance
* configure_server_commons: Removes cloud init related packages (Debian) , adds debian repos, modifies hosts,hostname,resolv
* manage_ec2_instance: Start,Stop,Restart ec2 instances

With the above roles we define some example playbooks that utilize them to setup fully operational ec2 instances

Example Playbooks:
* launch_ec2_instance.yml: Launches an aws ec2 instance according to variables
* configure_gold.yml : This will do some initial configuration on the matching ec2 instance in the dynamic inventory and then 
proceed to install ansible (and configure it so that we can reach and work on other servers in the same vpc) and some services 
such as DNS,SMTP,Docker,Gitlab,Wiki to have a central server for the infrastructure.

	To run an example playbook:
		ansible-playbook playbooks/<playbook name> -e "@variables/gold.yml"
