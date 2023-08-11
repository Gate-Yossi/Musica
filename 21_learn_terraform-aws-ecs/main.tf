terraform {

  cloud {
    organization = "xxx"
    workspaces {
      name = "learn-aws-ecs"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

# VPC
module "vpc" {
  source = "./vpc"

  name_prefix = var.name_prefix
  region      = var.region
  az_a        = var.az_a
  az_c        = var.az_c
  tag_name    = var.tag_name
  tag_group   = var.tag_group
}

# SG
module "sg" {
  source = "./sg"

  name_prefix = var.name_prefix
  region      = var.region
  az_a        = var.az_a
  az_c        = var.az_c
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  vpc_id = module.vpc.vpc_id
}

# ECS
module "ecs" {
  source = "./ecs"

  name_prefix = var.name_prefix
  region      = var.region
  az_a        = var.az_a
  az_c        = var.az_c
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  lb_target_group_arn = module.lb.lb_target_group_arn
  execution_role_arn  = module.iam.execution_role_arn
  public_a_id         = module.vpc.public_a_id
  public_c_id         = module.vpc.public_c_id
  sg_id               = module.sg.sg_id
}

# IAM
module "iam" {
  source = "./iam"

  name_prefix = var.name_prefix
  region      = var.region
  az_a        = var.az_a
  az_c        = var.az_c
  tag_name    = var.tag_name
  tag_group   = var.tag_group
}

# LB
module "lb" {
  source = "./lb"

  name_prefix = var.name_prefix
  region      = var.region
  az_a        = var.az_a
  az_c        = var.az_c
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  vpc_id      = module.vpc.vpc_id
  public_a_id = module.vpc.public_a_id
  public_c_id = module.vpc.public_c_id
  sg_id       = module.sg.sg_id
}
