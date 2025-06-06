output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.network.vpc_id
}

output "sga_instance_public_ip" {
  description = "Public IP of SGA instance"
  value       = module.instances.sga_instance_public_ip
}

output "sgb_instance_public_ip" {
  description = "Public IP of SGB instance"
  value       = module.instances.sgb_instance_public_ip
}
