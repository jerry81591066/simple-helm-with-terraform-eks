module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name                   = "bitoex"
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true

  cidr            = "10.0.0.0/16"
  public_subnets  = ["10.0.0.0/20", "10.0.32.0/20"]
  private_subnets = ["10.0.16.0/20", "10.0.48.0/20"]
  azs             = ["ap-northeast-1a", "ap-northeast-1d"]

  tags = {
    Terraform   = "true"
    Environment = "bitoex"
  }
}
