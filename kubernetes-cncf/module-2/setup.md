# Install Velero

First we need to install the Velero operator.

Let's pull down the VMWare Velero GitHub repository to help us get started:

`git clone --single-branch --branch release-0.11 https://github.com/heptio/velero`{{execute}}

> Note: Normally you can install the Velero operator via a helm chart.

Install the basic prerequisites (e.g. CustomResourceDefinitions, namespaces, and RBAC):

`kubectl apply -f velero/examples/common/00-prereqs.yaml`{{execute}}
`kubectl apply -f velero/examples/minio/`{{execute}}

Check to see that the Velero deployment has been successfully created:

`kubectl get deployments -l component=velero --namespace=velero`{{execute}}
