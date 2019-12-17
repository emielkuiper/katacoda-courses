# Disaster Scenario

Now, let's simulate a disaster scenario where we perhaps delete a production app.

`kubectl delete namespace nginx-example`{{execute}}

If we check to confirm you should notice that you get a no results messaged returned.

`kubectl get deployments --namespace=nginx-example`{{execute}}

`kubectl get services --namespace=nginx-example`{{execute}}

`kubectl get namespace/nginx-example`{{execute}}

> Note: You might need to wait for a few minutes for the namespace to be fully cleaned up.
