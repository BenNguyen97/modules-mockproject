data "aws_vpc" "existing" {
  id = var.vpc_id
}
# Tạo EKS Cluster
resource "aws_security_group" "eks_cluster_sg" {
  name        = var.eks_sg
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks] #[module.networking.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {}
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_name_arn #module.iam.eks_cluster_role_arn
  version     = var.kubernetes_version
  vpc_config {
    subnet_ids = var.public_subnet_ids #module.networking.public_subnet_ids  
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }
}

resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = var.cluster_name
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.eks_node_role_arn #module.iam.eks_work_node_role_arn
  ami_type        = var.ami_type
  instance_types  = [var.instance_types]
  subnet_ids = var.public_subnet_ids #module.networking.public_subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  depends_on = [aws_eks_cluster.eks]
}