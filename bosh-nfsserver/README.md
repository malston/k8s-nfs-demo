# bosh-nfsserver

A simple NFS server bosh release

## Create the bosh release

Build a release tarball

```bash
bosh create-release --force --timestamp-version --tarball nfsserver.tgz
```

Upload release

```bash
bosh upload-release
```

## Deploy

Create manifest

```bash
bosh interpolate -l templates/vars.yml templates/manifest.yml > nfsserver.yml
```

Deploy release

```bash
bosh deploy manifest.yml -d nfsserver
```

## Explore

```bash
bosh ssh -d nfsserver
sudo su -
monit summary
df -h
cd /var/vcap/store/nfsserver/
```

You will note that the user vcap, group vcap exists in BOSH deployed VM with uid 1000 and gid 1000.
The persistent volume /export/vol1 (for example - see the jobs/ folder to change) is rw for vcap.
Note that this is different uid/gid from the container volumen user which is uid 2000 gid 2000.
The nfsserver self-mount into /export/vol1 as test (for example - see the jobs/ folder to change)
