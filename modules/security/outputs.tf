output "sga_id" {
  description = "ID of Security Group A"
  value       = aws_security_group.sga.id
}

output "sgb_id" {
  description = "ID of Security Group B"
  value       = aws_security_group.sgb.id
}
