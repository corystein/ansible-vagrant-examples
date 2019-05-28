# Deployment Notes

## Getting Started

Start VM, using below command

```sh
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
vagrant up
```

Destroy VM, using below command

```sh
vagrant destroy --force
```

Remove all images

```sh
for vb in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy $vb --force ; done
```

Renove all boxes

```sh
vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f
```

Python Dependencies (Ansible Controller)

```sh
sudo pip install jmespath
sudo pip install pyOpenSSL
```
