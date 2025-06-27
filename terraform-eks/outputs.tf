# VPC Outputs
output "vpc_id" {
  value       = module.eks_vpc.vpc_id
  description = "The ID of the eks VPC"
}

output "private_subnets" {
  value       = module.eks_vpc.private_subnets
  description = "Private subnets"
}

output "public_subnets" {
  value       = module.eks_vpc.public_subnets
  description = "Public subnets"
}

output "intra_subnets" {
  value       = module.eks_vpc.intra_subnets
  description = "Intra subnets used for control plane"
}

# EKS Outputs
output "eks_cluster_name" {
  value       = module.eks.cluster_name
  description = "Name of the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint for the EKS cluster"
}

output "eks_cluster_version" {
  value       = module.eks.cluster_version
  description = "EKS Kubernetes version"
}

output "eks_node_group_arn" {
  value       = module.eks.eks_managed_node_groups["my-terra-ng"].node_group_arn
  description = "ARN of the EKS managed node group"
}

output "eks_node_group_name" {
  value       = module.eks.eks_managed_node_groups["my-terra-ng"].node_group_name
  description = "Name of the EKS managed node group"
}

# Security Group Output
output "eks_node_sg_id" {
  value       = module.eks_node_sg.security_group_id
  description = "Security Group ID for EKS nodes"
}

