# Velero Client

Let's download and install the Velero client:

`curl -LO https://github.com/heptio/velero/releases/download/v0.11.0/velero-v0.11.0-linux-amd64.tar.gz`{{execute}}

`tar -C /usr/local/bin -xzvf velero-v0.11.0-linux-amd64.tar.gz`{{execute}}

With the velero client install we can now work with the Velero operator installed in the cluster.

Let's backup any resource with that has the label "app=nginx":

`velero backup create nginx-backup --selector app=nginx`{{execute}}
