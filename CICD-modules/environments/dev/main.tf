module "networking" {
  source = "../../modules/networking"
  aws_region = var.aws_region
  vpc_cidr   = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
  
}
module "iam" {
  source = "../../modules/iam"
  eks_worker_node_role = var.eks_worker_node_role
  eks_cluster_role_name = var.eks_cluster_role_name
   
}
module "eks" {
    source = "../../modules/eks"
    cluster_name = var.cluster_name
    eks_cluster_role_name = var.eks_cluster_role_name
    kubernetes_version    = var.kubernetes_version
    eks_sg                = var.eks_sg
    eks_node_group_name   = var.eks_node_group_name
    ami_type              = var.ami_type
    instance_types        = var.instance_types
    min_size              = var.min_size
    desired_size          = var.desired_size
    max_size              = var.max_size
    tags                  = var.tags
    eks_worker_node_role  = var.eks_worker_node_role
    eks_cluster_role_name_arn = module.iam.eks_cluster_role_arn
    public_subnet_ids       = module.networking.private_subnet_ids
    eks_node_role_arn       = module.iam.eks_work_node_role_arn
    ingress_cidr_blocks     = module.networking.my_ip
    vpc_id = module.networking.vpc_id
}
module "ecr" {
  source = "../../modules/ecr"
  repository_name         = var.repository_name
  tags = var.tags
}