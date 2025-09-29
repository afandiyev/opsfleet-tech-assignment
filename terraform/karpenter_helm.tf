resource "helm_release" "karpenter" {
  name       = "karpenter"
  repository = "https://charts.karpenter.sh"
  chart      = "karpenter"
  namespace  = "karpenter"
  version    = "v1.0.7"

  values = [yamlencode({
    settings = {
      aws = {
        clusterName            = module.eks.cluster_name
        defaultInstanceProfile = aws_iam_instance_profile.karpenter.name
      }
    }
  })]

  depends_on = [module.eks, module.karpenter_irsa]
}
