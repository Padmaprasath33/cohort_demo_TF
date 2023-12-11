resource "aws_instance" "test-instance" {
    ami           = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    subnet_id     = module.vpc.aws_subnet_public[0]
    tags = var.resource_tags
}

