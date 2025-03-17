output "instance_public_ip" {
  value       = aws_instance.oleg_builder.public_ip
  description = "Public IP of the EC2 instance"
}

output "security_group_id" {
  value       = aws_security_group.oleg_builder_sg.id
  description = "ID of the security group"
}

output "subnet_id" {
  value       = aws_subnet.oleg_public_subnet.id
  description = "ID of the created public subnet"
}