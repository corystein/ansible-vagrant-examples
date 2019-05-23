# Deployment Notes

## Deploy

```sh
export
vagrant up
```

## Destroy

```sh
for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy -f $i ; done
```
