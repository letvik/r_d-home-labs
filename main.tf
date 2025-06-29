#Main VPC

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "dev-main"
  }
}

#IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "dev-igw"
  }
}

# Public Subnet in us-east-1a
resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "dev-public-us-east-1"
  }
}
#Route Table for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "dev-public"
  }
}

resource "aws_route_table_association" "public_zone1" {
  subnet_id      = aws_subnet.public_zone1.id
  route_table_id = aws_route_table.public.id
}

# Create an EC2 instance with Amazon Linux 2

resource "aws_instance" "amazon_linux_2" {
  ami                  = "ami-000ec6c25978d5999"
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.public_zone1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "dev-amazon-linux-2"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_s3_read_only_profile"
  role = aws_iam_role.s3_read_only.name
}

#IAM Role
resource "aws_iam_role" "s3_read_only" {
  name = "s3_read_only_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach a Managed Policy to the Role
resource "aws_iam_role_policy_attachment" "s3_read_only_role_policy_attachment" {
  role       = aws_iam_role.s3_read_only.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

#S3 Bucket
resource "aws_s3_bucket" "my_tf_s3_bucket" {
  bucket = "my-tf-s3-bucket-${var.env}"

  tags = {
    Name        = "my-tf-s3-bucket"
    Environment = var.env
  }

}

#S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_tf_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

#S3 Bucket Policy to deny public access
resource "aws_s3_bucket_policy" "deny_public_access" {
  bucket = aws_s3_bucket.my_tf_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyPublicRead"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_tf_s3_bucket.arn}/*"
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
