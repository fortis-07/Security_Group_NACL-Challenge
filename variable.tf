variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "proj2"
}

variable "key_name" {
  description = "Name of existing EC2 key pair"
  type        = string
}

variable "instance_name_prefix" {
  description = "Prefix for instance names"
  type        = string
  default     = "proj2-instance"
}
