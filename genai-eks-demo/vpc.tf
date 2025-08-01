module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 5.21"
  name = local.name
  cidr = local.vpc_cidr
  azs = local.azs
  private_subnets = [for k, v in local.azs: cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets = [for k, v in local.azs: cidrsubnet(local.vpc_cidr, 8, k + 48)]
  enable_nat_gateway = true
  single_nat_gateway = true
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "karpenter.sh/discovery" = local.name
  }
}
output vpc_id {
    description = "VPC ID"
    value = "${module.vpc.vpc_id}"
}