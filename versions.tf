terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6"
    }
    
    /*datadog = {
      source = "DataDog/datadog"
    }*/
  }
  backend "s3" {
    //bucket         = "prasath-cohort-demo"
    bucket = "proserv-aws-development-application-terraform-state"
    //key            = "cohort_demo/dev/terraform.tfstate"
    key            = "2191420/dev/terraform.tfstate"
    region         = "us-east-1"
    //dynamodb_table = "prasath-cohort-demo"
    dynamodb_table = "proserv-aws-development-application-terraform-state-lock-table"
  }
}

provider "aws" {
  region  = var.region
}

/*provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
*/

