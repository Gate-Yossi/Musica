
variable "region"      {}
variable "az_a"        {}
variable "az_c"        {}
variable "name_prefix" {}
variable "tag_name"    {}
variable "tag_group"   {}

variable "task_role_arn"       {}
variable "execution_role_arn"  {}
variable "public_a_id"         {}
variable "public_c_id"         {}
variable "sg_id"               {}
variable "lb_target_group_arn" {}

variable "repository_url" {
    default = "452320731156.dkr.ecr.ap-northeast-1.amazonaws.com/learn_aws_ecr"
}
