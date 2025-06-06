variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "sga_name" {
  description = "Name for Security Group A"
  type        = string
  default     = "SGA"
}

variable "sgb_name" {
  description = "Name for Security Group B"
  type        = string
  default     = "SGB"
}
