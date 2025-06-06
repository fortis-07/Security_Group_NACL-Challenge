output "sga_instance_public_ip" {
  description = "Public IP of SGA instance"
  value       = aws_instance.sga_instance.public_ip
}

output "sgb_instance_public_ip" {
  description = "Public IP of SGB instance"
  value       = aws_instance.sgb_instance.public_ip
}
