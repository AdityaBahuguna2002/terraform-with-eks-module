module "eks" {

  # IMPORT THE MODULE TEMPLATE FROM THE REGISTRY
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"  

  # EKS Cluster Name or Information (control plane)
  cluster_name    = local.name
  cluster_version = "1.31"

  # outside access to the cluster
  cluster_endpoint_public_access = true

  vpc_id = module.eks_vpc.vpc_id
  subnet_ids = module.eks_vpc.private_subnets

  # CNI - container Network Interface | use the most recent version
  cluster_addons = {
    vpc-cni = {
      most-recent = true 
    }
    kube-proxy = {
      most-recent = true
    }
    core-dns = {
      most-recent = true
    } 
  }

  # control plane network configuration
  control_plane_subnet_ids = module.eks_vpc.intra_subnets


  # EKS Managed Node Group(s) | managing nodes in the cluster
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro"]
    attach_cluster_primary_security_group = true # give sg to new node groups
  }


eks_managed_node_groups = {
    my-terra-ng = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 3
      desired_size = 1

      capacity_type = "SPOT"

      Security_groups = [module.eks_node_sg.security_group_id]
      key_name       = local.key_name
    }
  }

  tags = {
    Environment = local.env
    Name        = local.name
    Terraform   = "true"
  }
}