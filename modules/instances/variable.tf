variable "instance_name_prefix" {
  description = "Prefix for instance names"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where instances will be launched"
  type        = list(string)
}

variable "sga_id" {
  description = "Security Group A ID"
  type        = string
}

variable "sgb_id" {
  description = "Security Group B ID"
  type        = string
}

variable "key_name" {
  description = "Name of existing EC2 key pair"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
