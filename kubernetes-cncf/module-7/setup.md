# Configure Open Policy Agent

First, let's make sure that the Open Polict Agent (OPA) is working.

`kubectl get po -n gatekeeper-system`{{execute}}

Once we have confirmed that the OPA container is running we can install our first constraint template.
