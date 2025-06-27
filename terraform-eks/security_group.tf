module "eks_node_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = "${local.name}-node-sg"
  description = "Security group for EKS managed nodes"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = local.ingress_rules
  egress_with_cidr_blocks   = local.egress_rules

  tags = {
    Name        = "${local.name}-node-sg"
    Environment = local.env
  }
}
