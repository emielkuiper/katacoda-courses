# Deploy Nginx App

Deploy an example nginx application:

`kubectl apply -f velero/examples/nginx-app/base.yaml`{{execute}}

Check to see that the Nginx deployment has been successfully created:

`kubectl get deployments --namespace=nginx-example`{{execute}}
