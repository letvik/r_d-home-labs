
output "ec2_ip" {
  value = aws_instance.amazon_linux_2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_tf_s3_bucket.bucket
}
