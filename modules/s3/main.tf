resource "aws_s3_bucket" "my_tf_s3_bucket" {
  bucket = "my-tf-s3-bucket-${var.env}"

  tags = {
    Name        = "my-tf-s3-bucket"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_tf_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "deny_public_access" {
  bucket = aws_s3_bucket.my_tf_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "DenyPublicRead"
      Effect    = "Deny"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.my_tf_s3_bucket.arn}/*"
      Condition = {
        Bool = { "aws:SecureTransport" = "false" }
      }
    }]
  })
}
