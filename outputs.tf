output "public_ec2_ip" {
  value = module.ec2.public_ec2_ip
}

output "private_ec2_id" {
  value = module.ec2.private_ec2_id
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}
