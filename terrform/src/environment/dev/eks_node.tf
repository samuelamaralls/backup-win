module "eks_node1" {
    source = "../../../modules/eks/node_group"
    environment = var.environment
    name = "homolog"
    cluster_name = module.eks_cluster1.name
    instance_type = "t3.xlarge"
    subnet_ids = var.private_subnets
    /*capacity_type          = "ON_DEMAND"*/
    min_size = 1
    max_size = 9
    desired_size = 2 // DO NOT UPDATE
    tags = {
      Name = "homolog" 
    }
    labels = {
        name = "homolog",
    }
}

module "eks_node2" {
    source = "../../../modules/eks/node_group"
    environment = var.environment
    name = "homolog2"
    cluster_name = module.eks_cluster1.name
    instance_type = "t3.xlarge"
    subnet_ids = var.private_subnets
    /*capacity_type          = "ON_DEMAND"*/
    min_size = 1
    max_size = 9
    desired_size = 2 // DO NOT UPDATE
    tags = {
      Name = "homolog2" 
    }
    labels = {
        name = "homolog2",
    }
}

module "eks_node3" {
    source = "../../../modules/eks/node_group"
    environment = var.environment
    name = "homolog3"
    cluster_name = module.eks_cluster1.name
    instance_type = "t3.xlarge"
    subnet_ids = var.private_subnets
    /*capacity_type          = "ON_DEMAND"*/
    min_size = 1
    max_size = 9
    desired_size = 2 // DO NOT UPDATE
    tags = {
      Name = "homolog3" 
    }
    labels = {
        name = "homolog3",
    }
}

module "eks_node4" {
    source = "../../../modules/eks/node_group"
    environment = var.environment
    name = "homolog4"
    cluster_name = module.eks_cluster1.name
    instance_type = "t3.medium"
    subnet_ids = var.private_subnets
    /*capacity_type          = "ON_DEMAND"*/
    min_size = 1
    max_size = 9
    desired_size = 2 // DO NOT UPDATE
    tags = {
      Name = "homolog4" 
    }
    labels = {
        name = "homolog4",
    }
}
