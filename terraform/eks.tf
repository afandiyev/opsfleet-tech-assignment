module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.17"

  cluster_name    = var.cluster_name
  cluster_version = "1.32"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true
  enable_irsa = true

  eks_managed_node_groups = {
    bootstrap = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
      capacity_type  = "ON_DEMAND"
    }
  }
}
