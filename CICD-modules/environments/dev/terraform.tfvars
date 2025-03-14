aws_region = "ap-southeast-1"
vpc_cidr   = "10.0.0.0/16"

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
# Tên của EKS cluster
cluster_name = "Luan-eks-cluster"

# Tên IAM role của EKS cluster
eks_cluster_role_name = "eks-cluster-role"

# Phiên bản Kubernetes
kubernetes_version = "1.27"

# Tên security group của EKS cluster
eks_sg = "eks-cluster-sg"

# Tên của EKS node group
eks_node_group_name = "Luan-eks-node-group"

# Loại AMI của EKS node group
ami_type = "AL2_x86_64"

# Loại instance của EKS node group
instance_types = "t3.medium"

# Số lượng node tối thiểu trong EKS node group
min_size = 1

# Số lượng node mong muốn trong EKS node group
desired_size = 2

# Số lượng node tối đa trong EKS node group
max_size = 3

# Các thẻ (tags) cho tài nguyên
tags = {
  Environment = "Production"
  Project     = "EKS-Cluster"
  Owner       = "DevOps-Team"
}
eks_worker_node_role = "eks-worker-node-role"
repository_name = "Luan-ECR"