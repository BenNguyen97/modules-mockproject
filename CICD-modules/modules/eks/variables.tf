# Biến cho tên của EKS cluster
variable "cluster_name" {
  description = "Tên của EKS cluster"
  type        = string
}

# Biến cho tên IAM role của EKS cluster
variable "eks_cluster_role_name" {
  description = "Tên của IAM role dành cho EKS cluster"
  type        = string
}

# Biến cho phiên bản Kubernetes
variable "kubernetes_version" {
  description = "Phiên bản Kubernetes cho EKS cluster"
  type        = string
}

# Biến cho tên security group của EKS cluster
variable "eks_sg" {
  description = "Tên của security group dành cho EKS cluster"
  type        = string
}

# Biến cho tên của EKS node group
variable "eks_node_group_name" {
  description = "Tên của EKS node group"
  type        = string
}

# Biến cho loại AMI của EKS node group
variable "ami_type" {
  description = "Loại AMI cho EKS node group"
  type        = string
}

# Biến cho loại instance của EKS node group
variable "instance_types" {
  description = "Loại instance cho EKS node group"
  type        = string
}

# Biến cho số lượng node tối thiểu trong EKS node group
variable "min_size" {
  description = "Số lượng node tối thiểu trong EKS node group"
  type        = number
}

# Biến cho số lượng node mong muốn trong EKS node group
variable "desired_size" {
  description = "Số lượng node mong muốn trong EKS node group"
  type        = number
}

# Biến cho số lượng node tối đa trong EKS node group
variable "max_size" {
  description = "Số lượng node tối đa trong EKS node group"
  type        = number
}

# Biến cho tags của tài nguyên
variable "tags" {
  description = "Các tags cho tài nguyên"
  type        = map(string)
}

variable "eks_worker_node_role" {
  description = "EKS worker node role name"
  type = string
}

variable "ingress_cidr_blocks" {
  description = "Local ip"
  type = string
}
variable "eks_cluster_role_name_arn" {
  description = "IAM role eks cluster"
  type = string
}
variable "public_subnet_ids" {
  description = "EKS subnet get from vpc"
  type = any
}
variable "eks_node_role_arn" {
  description = "IAM role eks worker node"
  type = string
}
variable "vpc_id" {
  description = "vpc id"
  type = string
}