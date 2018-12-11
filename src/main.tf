resource "null_resource" "first" {
  provisioner "local-exec" {
    command = "echo 'first'"
  }
}

resource "null_resource" "second" {
  provisioner "local-exec" {
    command = "echo 'second'"
  }
}

resource "null_resource" "third" {
  provisioner "local-exec" {
    command = "echo 'third'"
  }
}

