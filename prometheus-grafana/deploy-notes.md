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

Remove all boxes

```sh
for vb in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy $vb --force ; done
```
