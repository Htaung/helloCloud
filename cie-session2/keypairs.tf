resource "tls_private_key" "hellocloud" {
    algorithm = "ED25519"
}

locals{
    private_key_file_name = "${var.prefix}-ssh-key.pem"
}

resource "aws_key_pair" "this" {
  key_name   = local.private_key_file_name
  public_key = "${tls_private_key.hellocloud.public_key_openssh}"
}

resource "local_file" "private_key" {
  content  = "${tls_private_key.hellocloud.private_key_openssh}"
  filename = "${path.root}/generated/${local.private_key_file_name}"

   provisioner "local-exec" {
    command = "chmod 400 ${path.root}/generated/${local.private_key_file_name}"
  }
}

resource "null_resource" "delete_key" {
  # Triggers regeneration if the filename changes
  triggers = {
    filename = local_file.private_key.filename
  }

  # Executes code only during 'terraform destroy'
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ${self.triggers.filename}"
  }
}