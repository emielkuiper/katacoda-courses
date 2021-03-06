
Now let's take Terraform's power to the next level, and this is where
the benefits of it start to shine.

We can reference previously created resources in order to create additional
resources. The referenced values can be from information you provided to
that resource (meaning you only maintain it in one place) or it can
be from information filled in after the resource is created (for example,
an unique object id generated by the cloud environment).

Resources can be referenced using the following format:

`$resource_type.$resource_name.$value`

So for our namespace, we can use `kubernetes_namespace.test.id` to get its identifier in the cluster.

If we wanted to include it in a string of other text, Terraform supports string interpolation. For example,
we could write "key = "something.${kubernetes_namespace.test.id}"`.

Once again, let's open our `terraform/namespaces.tf` file in the editor and update it with:

<pre class="file" data-filename="terraform/namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"

    labels = {
      "service.example.com/owner" = "infrastructure-team"
      "service.example.com/technical-contact" = "infrastructure.support"
      "service.example.com/business-contact" = "infrastructure.admin"
    }
  }
}

resource "kubernetes_role" "test_namespace_reader" {
  metadata {
    name = "namespace_reader"
    namespace = kubernetes_namespace.test.id
  }

  # Allow the user to get pods (and higher level constructs)
  rule {
    api_groups = [""]
    resources = ["deployments", "statefulsets", "replicasets", "pods", "services"]
    verbs = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "test_namespace_readers" {
  metadata {
    name = "namespace_readers"
    namespace = kubernetes_namespace.test.id
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "Role"
    name = kubernetes_role.test_namespace_reader.metadata.0.name
  }

  subject {
    api_group = "rbac.authorization.k8s.io"
    kind = "User"
    name = "john.doe@example.com"
  }
}
</pre>

We can now run `terraform plan -out plan`{{execute}} to plan our changes. Since the changes
look reasonable, let's run `terraform apply plan`{{execute}} to apply those changes to the cluster.

> Using linked resources allows Terraform to identify dependencies so that it ensures
> that dependent resources are created beforehand.
