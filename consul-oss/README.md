# Consul

This vagrant directory deploys a Consul cluster

## Build

```sh
vagrant up
```

## Clean Up

```sh
for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy -f $i ; done
vagrant global-status --prune
```

## Ansible Controller Prereqs

```sh
pip install ipython
pip install netaddr
```

## Links

https://medium.com/@megawan/provisioning-vagrant-multi-machines-with-ansible-32e1809816c5
https://github.com/pavel-klimiankou/vagrant-consul/blob/master/Vagrantfile
https://github.com/hashicorp/consul/blob/master/demo/vagrant-cluster/Vagrantfile
https://www.vagrantup.com/docs/provisioning/ansible.html
