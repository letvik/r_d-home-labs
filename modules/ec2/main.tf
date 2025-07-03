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

resource "aws_iam_role_policy_attachment" "s3_read_only_role_policy_attachment" {
  role       = aws_iam_role.s3_read_only.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_s3_read_only_profile"
  role = aws_iam_role.s3_read_only.name
}

resource "aws_instance" "public_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  tags = { Name = "dev-public-ec2" }
}

resource "aws_instance" "private_instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = var.private_subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = { Name = "dev-private-ec2" }
}
