#!/bin/sh
# Script to run ansible playbooks to provision and configure an Ampard ec2 instance
# Written by AKA@Ampard 03-09-2019

USAGE="USAGE: $0 -c ANSIBLE_VARIABLES"

ANSIBLE=$(/usr/bin/which ansible-playbook)

LAUNCH_EC2="/etc/ansible/playbooks/launch_new_ec2_instance.yml" 
CONFIGURE_EC2="/etc/ansible/playbooks/configure_new_ec2_instance.yml" 

CREDS_EXPORT_SCRIPT="/root/.aws/creds.sh"

# Parse command line arguments
while getopts 'c:' OPT;do
	case $OPT in
		c)  ANSIBLE_VARIABLES=$OPTARG
		;;
		*) echo $USAGE
		exit
		;;
	esac
done

. $CREDS_EXPORT_SCRIPT

[ -z $ANSIBLE_VARIABLES ] && {
	echo "No Ansible variables file specified"
	echo $USAGE
	exit 0
}

[ -z $ANSIBLE ] && {
	echo "Missing ansible-playbook!Aborting."
	exit 0
}

[ ! -f $ANSIBLE_VARIABLES ] && {
	echo "Ansible variables file specified but doesn't exist at $ANSIBLE_VARIABLES"
	exit 0
}

# Next we run playbook that provisions  a basic ec2 instance
# This will start a generic new ec2 instance based on directives found in the configuration file passed with the flag -e
[ ! -f $LAUNCH_EC2 ] && {
	echo "Missing playbook that launches ec2 instance.Abort"
	exit 0
}

$ANSIBLE $LAUNCH_EC2 -e "@$ANSIBLE_VARIABLES"

# Next we put the script into sleep for 6 mints,it takes almost that time for aws to start a new instance
# This needs some review or perhaps adding a check mechanism here to determine when to move on to next step
#sleep 600

#[ ! -f $CONFIGURE_EC2 ] && {
#	echo "Missing playbook that does ec2 instance configuration.Abort"
#	exit 0
#}

#$ANSIBLE $CONFIGURE_EC2 -e "@$ANSIBLE_VARIABLES"
