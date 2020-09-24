# Troubleshooting

```bash
#!/usr/bin/env bash

# Create a user
sudo useradd bob

# Assign a new uid
usermod -u 2005 bob

# To see the UID for bob
id -u bob

# Su to bob
su bob

# Verify that you changed UID and GID for given users with the help of ls command
# Please note that all files which are located in the user’s home directory will have the file UID changed automatically
cd; ls -l
# To see UID/GID
ls -n

# To mount an nfsv4 share: https://askubuntu.com/questions/35077/cannot-mount-nfs4-share-no-such-file-or-directory
# The value 0 has a special meaning when use with NFSv4. NFSv4 has a concept of a root of the overall exported filesystem. 
# The export point exported with fsid=0 will be used as this root.

# Therefore include fsid=0 into /etc/exports and then do the following:

mount -t nfs4 <serverip>:/ /localmount/point

and not

mount -t nfs4 <serverip>:/exports /localmount/point

mount -v -t nfs4 10.197.73.107:/ /bob

# To see version of nfs is being used
nfsstat –c

# If you make any changes to /etc/exports file on the server side, then run the below command to tell NFS server to re-read /etc/exports file.

sudo exportfs -ra

# Show mounts from nfs server to a worker

# login to worker

# to list the set of clients who are mounting from the nfs server
showmount <NFS_IP_ADDRESS>

# to see the exported mounts from the nfs server
showmount -e <NFS_IP_ADDRESS>
```
