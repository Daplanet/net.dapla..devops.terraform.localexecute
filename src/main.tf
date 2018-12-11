resource "null_resource" "provision_ansible" {
  provisioner "local-exec" {
    command = "apk add --no-cache ansible"
  }
}

resource "null_resource" "ping" {
  depends_on = ["null_resource.provision_ansible"]
  provisioner "local-exec" {
    command = "/usr/bin/ansible -m setup all"
  }
}

