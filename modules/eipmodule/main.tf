resource "aws_eip" "eipmini" {
  instance = var.instance_id

  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${self.public_ip} ID: ${module.miniec2.id} AZ: ${module.miniec2.availability_zone} > infos_ec2.txt"  
  }
}