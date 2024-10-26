output "bastion_id" {
  value       = aws_eip.bastion-eip.public_ip
  description = "IP of the created instance"
}
