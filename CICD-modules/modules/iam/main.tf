# Tạo IAM role EKS Cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = var.eks_cluster_role_name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
# Gắn IAM Role cho cluster
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Tạo IAM role worker nodes
resource "aws_iam_role" "eks_node_role" {
  name = var.eks_worker_node_role
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_registry_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Thêm quyền truy cập S3 cho EKS Cluster & Worker Node
resource "aws_iam_policy" "s3_read_policy" {
  name        = "EKS_S3_Read_Policy_v2"
  description = "Cho phép EKS đọc file từ S3"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = [ "s3:GetObject", "s3:ListBucket" ]
        Resource  = [ "arn:aws:s3:::luan-mock-project", "arn:aws:s3:::luan-mock-project/*" ]
      }
    ]
  })
}

# Gán chính sách S3 vào EKS Cluster Role
resource "aws_iam_role_policy_attachment" "s3_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

# Gán chính sách S3 vào EKS Node Role
resource "aws_iam_role_policy_attachment" "s3_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}