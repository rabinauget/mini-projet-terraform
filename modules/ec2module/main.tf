data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-*"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instance_type
  key_name        = "terraform-training"
  tags            = var.aws_common_tag
  security_groups = [aws_security_group.allow_http_https_ssh.name]

  provisioner "remote-exec" {
    inline = [ 
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type = var.connexion_types
      user = var.connexion_username
      private_key = file("../../.secrets/terraform-training.pem")
      host = self.public_ip
    }
  }
}
