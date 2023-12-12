module "vpc" {
  source  = "git::https://github.com/Padmaprasath33/aws_network_module?ref=main"
  region = var.region
  az_count = var.az_count
  cidr_block = var.cidr_block
  app_port = var.app_port
  account_id = var.aws_account_id
  resource_tags = var.resource_tags
  resource_tags_dr = var.resource_tags_dr

}   

module "s3_efs" {
    source = "git::https://github.com/Padmaprasath33/aws_storage_module?ref=main"
    depends_on = [ module.vpc ]
    bucket_name = var.bucket_name
    log_bucket_name = var.log_bucket_name
    vpc_id = module.vpc.vpc_id  
    efs_subnet_ids = module.vpc.aws_subnet_private
    cohort_demo_efs_sg = module.vpc.cohort_demo_efs_sg
    region = var.region
    resource_tags = var.resource_tags
    resource_tags_dr = var.resource_tags_dr
} 

module "ecr" {
    source = "git::https://github.com/Padmaprasath33/aws_ecr_module?ref=main"
    cohort_demo_ecr_crr_region = var.cohort_demo_ecr_crr_region
    resource_tags = var.resource_tags
    resource_tags_dr = var.resource_tags_dr
} 
   
module "ecs" {
    source = "git::https://github.com/Padmaprasath33/aws_ecs_module?ref=main"
    depends_on = [ module.vpc, module.s3_efs, module.ecr, module.tooling ]
    cohort_demo_ecs_cluster_name = var.cohort_demo_ecs_cluster_name
    ecs_fargate_cpu = var.ecs_fargate_cpu
    ecs_fargate_memory = var.ecs_fargate_memory
    aws_account_id = var.aws_account_id
    region = var.region
    ecr_repo_name = var.ecr_repo_name
    image_tag =var.image_tag
    container_port = var.container_port
    efs_volume_name = var.efs_volume_name
    aws_efs_file_system_id = module.s3_efs.cohort_demo_efs_filesystem_id
    aws_efs_access_point_id = module.s3_efs.aws_efs_access_point_id
    aws_security_group_application_elb_sg_id = module.vpc.application_elb_sg
    aws_security_group_application_elb_internal_sg_id = module.vpc.application_elb_internal_sg
    ecs_tasks_sg = module.vpc.ecs_tasks_sg_id
    ecs_backend_tasks_sg = module.vpc.ecs_backend_tasks_sg_id
    vpc_id = module.vpc.vpc_id
    ecs_public_subnet_ids = module.vpc.aws_subnet_public
    ecs_private_subnet_ids = module.vpc.aws_subnet_private
    resource_tags = var.resource_tags
    resource_tags_dr = var.resource_tags_dr
    health_check_path = var.health_check_path
}   

module "tooling" {
    source = "git::https://github.com/Padmaprasath33/aws_tooling_module?ref=main"
    region = var.region
    account_id = var.aws_account_id
    resource_tags = var.resource_tags
    resource_tags_dr = var.resource_tags_dr
}     

module "datadog" {
    source = "git::https://github.com/Padmaprasath33/aws_datadog_module?ref=main"
    region = var.region
    aws_account_id = var.aws_account_id
}  


 
