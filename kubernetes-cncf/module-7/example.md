## Example

For example, given the constraint we have installed I can make sure they every object deployed in the cluster must have a business unit contact.

Reject a request:

`kubectl create namespace test -o yaml`{{execute}}

> Note: Take note of the message that OPA sends back to you explaining why the request was rejected.

Show a compliant namespace:

`cat ./resources/namespace-with-labels.yaml`{{execute}}

Create a compliant namespace:

`kubectl create -f ./resources/namespace-with-labels.yaml`{{execute}}
