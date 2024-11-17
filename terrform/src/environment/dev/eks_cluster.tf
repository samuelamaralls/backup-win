
module "eks_cluster1" {
  source                = "../../../modules/eks/cluster"
  name                  = "dev-cluster-zenir"
  region                = "us-east-1"
  environment           = var.environment
  k8s_version           = "1.30"
  vpc_id                = var.vpc_id
  subnet_ids            = var.private_subnets

  eks_cluster_addons = {
    kube-proxy = {
      resolve_conflicts_on_update = "OVERWRITE"
    }
#   aws-ebs-csi-driver = {
#     resolve_conflicts_on_update        = "OVERWRITE"
#  //   service_account_role_arn = module.cluster_postinstall_eks1_nodegrp1.iam_ebs_csi_role_id
#     }
  vpc-cni = {
    resolve_conflicts_on_update = "OVERWRITE"
    }
  }

}

