variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}
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

# Biến cho tags (các thẻ) của tài nguyên
variable "tags" {
  description = "Các thẻ (tags) cho tài nguyên"
  type        = map(string)
}
variable "eks_worker_node_role" {
  description = "EKS worker node role name"
  type = string
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  
}
