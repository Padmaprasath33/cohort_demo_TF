output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

/*output "vpc_secondary_cidr_block" {
  value = module.vpc_secondary.vpc_cidr_block
}
*/
output "vpc_id" {
  value = module.vpc.vpc_id
}

/*output "vpc_secondary_id" {
  value = module.vpc_secondary.vpc_id
}
*/

output "aws_subnet_public_vpc" {
  //value = aws_subnet.public_subnet[*].id
  value = module.vpc.aws_subnet_public
}

output "aws_subnet_private_vpc" {
  value = module.vpc.aws_subnet_private
}

/*output "aws_subnet_public_secondary_vpc" {
  //value = aws_subnet.public_subnet[*].id
  value = module.vpc_secondary.aws_subnet_public
}

output "aws_subnet_private_secondary_vpc" {
  value = module.vpc_secondary.aws_subnet_private
}
*/