variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    project     = "aws-proserv",
    environment = "dev"
    application = "cohort-demo"
  }
}

variable "resource_tags_dr" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    project     = "aws-proserv",
    environment = "dev"
    application = "cohort-demo"
    backup      = "yes"
  }
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "cidr_block" {
  description = "VPV Cidr range"
  default     = "10.1.0.0/16"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "bucket_name" {
  description = "S3 bucket name"
  default     = "2191420-cohort-demo"
}

variable "log_bucket_name" {
  description = "S3 logging bucket name"
  default     = "2191420-cohort-demo-log-bucket"
}

variable "cohort_demo_efs_creation_token" {
  description = "EFS creation token"
  default     = "2191420-cohort-demo-efs-creation-token"
}

variable "cohort_demo_ecr_crr_region" {
  description = "ECR cross region replication region"
  default     = "us-west-2"
}

variable "cohort_demo_ecs_cluster_name" {
  description = "ECS cluster name"
  default     = "2191420-cohort_demo_ecs_cluster"
}

variable "ecs_fargate_cpu" {
  description = "ECS fargate cpu"
  default     = "256"
}

variable "ecs_fargate_memory" {
  description = "ECS fargate memory"
  default     = "512"
}

variable "aws_account_id" {
  description = "AWS account ID"
  default     = "412699049661"
}

variable "ecr_repo_name" {
  description = "AWS ecr_repo_name"
  default     = "2191420-cohort_demo"
}

variable "image_tag" {
  description = "AWS ECR image tag"
//412699049661.dkr.ecr.us-east-1.amazonaws.com/cohort_demo:5dab2de
  default     = "34c9f8f"
}

variable "container_port" {
  description = "ECS container_port"
  default     = 80
}

variable "efs_volume_name" {
  description = "AWS EFS volume name"
  default     = "2191420-cohort-demo-ecs-container-volume"
}

variable "health_check_path" {
  default = "/"
}