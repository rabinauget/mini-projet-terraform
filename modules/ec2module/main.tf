data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

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
  security_groups = [module.mysg.sgname]

  provisioner "remote-exec" {
    inline = [ 
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type = var.connexion_type
      user = var.connexion_username
      private_key = file("../.secrets/terraform-training.pem")
      host = self.public_ip
    }
  }
}

module "mysg" {
  source = "../sgmodule"
  sg_name = var.sgec2
}