resource "aws_ebs_volume" "ebsmini" {
    availability_zone = var.ebs_availability_zone
    type = var.ebs_volume_type
    size = var.ebs_volume_size

    tags = {
      name = var.ebs_volume_tag
    }
}