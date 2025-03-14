# output "vpc" {
#   value = {
#     aws_region = aws_vpc.main.region
#     cidr_block = aws_vpc.main.cidr_block

#   }
#}
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
output "my_ip" {
  value = local.my_ip
}
output "eks_cluster_sg" {
  value = aws_default_security_group.vpc_sg
}
# output "vpc" {
#   value = {
#     cid
#   }
# }