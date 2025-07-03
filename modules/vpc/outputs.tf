output "subnet_id" {
  value = aws_subnet.public_zone1.id
}

output "private_subnet_id" {
  value = aws_subnet.private_zone1.id
}
