# Windows 2016 OpenSSH

This vagrant directory deploys a Windows 2016 with OpenSSH and uses Ansible via ssh

## Build

```sh
vagrant up
```

## Clean Up

```sh
for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy -f $i ; done
```
