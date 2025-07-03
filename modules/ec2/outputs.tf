output "public_ec2_ip" {
  value = aws_instance.public_instance.public_ip
}

output "private_ec2_id" {
  value = aws_instance.private_instance.id
}
