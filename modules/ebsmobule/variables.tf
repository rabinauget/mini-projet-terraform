variable "ebs_availability_zone" {
  type = string
  description = "availability zone for mini-projet instance"
  default = "us-east-1"
}

variable "ebs_volume_type" {
  type = string
  description = "volume type for mini-projet instance"
  default = "standard"
}

variable "ebs_volume_size" {
  type = number
  description = "volume size for mini-projet instance"
  default = 40
}

variable "ebs_volume_tag" {
  type = string
  description = "tag for mini-projet instance"
  default = "mini-projet-terraform"
}