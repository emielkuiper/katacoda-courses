## Constraint Templates

Constraint Templates allow people to declare new constraints. They can provide the expected input parameters and the underlying Rego necessary to enforce their intent.

Show the constraint template:

`cat ./resources/constraint-template.yaml`{{execute}}

Create the create constraint template object:

`kubectl create -f ./resources/constraint-template.yaml`{{execute}}
