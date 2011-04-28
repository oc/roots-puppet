#!/bin/bash
#
# Prepares a new puppet-node by installing puppet (from the epel-testing repository).
#

set -e # exit immediately if a cmd fails

# Install rpmforge and epel repositories
rpm -Uhv http://apt.sw.be/redhat/el5/en/i386/rpmforge/RPMS/rpmforge-release-0.5.2-2.el5.rf.i386.rpm

REPO=epel-testing # should be set to 'epel' when puppet 2.6.x stable is uploaded there.
rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm
yum install puppet -qy --enablerepo=${REPO}

# Set hostname of node
echo "*[ Enter hostname ]*******************************"
read HOSTNAME
echo ${HOSTNAME} > /etc/hostname && hostname -F /etc/hostname

# Append host to /etc/hosts
PUBLIC_IPADDR=`ifconfig eth0 | awk -F':' '/inet addr/{split($2,_," ");print _[1]}'`
echo -e "${PUBLIC_IPADDR}\t$(hostname) $(hostname -s)" >> /etc/hosts

echo "*[ OK ]*******************************************"
echo " Now you need to configure the node"
echo
echo " 1) Start by adding the puppetmaster config, eg:"
echo "    PUPPET_SERVER=mgmt.bring.no"
echo "    /etc/sysconfig/puppet"
echo " 2) Then start the service: service puppet start"
echo " 3) Enable start on reboot: chkconfig puppet on"
echo "**************************************************"