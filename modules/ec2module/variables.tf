variable "instance_type" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "mini-projet"
  }
}

variable "connexion_type" {
  type = string
  description = "connexion type used by terraform for ec2 access"
  default = "ssh"
}

variable "connexion_username" {
  type = string
  description = "username used by terraform for ec2 access"
}