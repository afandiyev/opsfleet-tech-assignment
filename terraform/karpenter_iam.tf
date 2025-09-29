module "karpenter_irsa" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "~> 20.17"

  cluster_name     = module.eks.cluster_name
  namespace        = "karpenter"
  service_account  = "karpenter"
}

resource "aws_iam_instance_profile" "karpenter" {
  name = "${var.cluster_name}-karpenter"
  role = module.karpenter_irsa.iam_role_name
}
