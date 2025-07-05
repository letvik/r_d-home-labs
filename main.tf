module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.az
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-000ec6c25978d5999"
  instance_type     = "t2.micro"
  public_subnet_id  = module.vpc.subnet_id
  private_subnet_id = module.vpc.private_subnet_id
}

module "s3" {
  source = "./modules/s3"
  env    = var.env
}

resource "aws_instance" "my-ec2-tf-import-demo" {
  ami           = "ami-000ec6c25978d5999"
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-tf-import-demo"
  }
}
