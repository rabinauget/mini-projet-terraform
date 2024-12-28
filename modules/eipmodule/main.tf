resource "aws_eip" "eipmini" {
  instance = var.instance_id

  tags = {
    name = AppEIP
  }
}