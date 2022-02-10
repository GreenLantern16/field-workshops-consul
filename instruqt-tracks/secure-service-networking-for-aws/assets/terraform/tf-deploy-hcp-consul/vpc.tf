module "vpc_services_eks_dev" {
  source = "terraform-aws-modules/vpc/aws"

#  name = "vpc_services_eks"
  name = "vpc_services_eks_dev"
  cidr = "10.0.0.0/16"

#  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
#  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

#module "vpc_services_ecs" {
module "vpc_services_eks_prod" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc_services_eks_prod"
#  name = "vpc_services_ecs"
  cidr = "10.1.0.0/16"

#  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
#  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}