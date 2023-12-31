output "public_subnet_1_id" {
  value = aws_subnet.public-subnet-1.id
}
output "public_subnet_2_id" {
  value = aws_subnet.public-subnet-2.id
}
output "private_subnet_1_id" {
  value = aws_subnet.private-subnet-1.id
}
output "private_subnet_2_id" {
  value = aws_subnet.private-subnet-2.id
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}