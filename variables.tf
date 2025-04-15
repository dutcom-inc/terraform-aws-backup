#########################
### Default variables ###
#########################
variable "region" {
  type = string
}

variable "infra_provider" {
  type = string
}

variable "owner" {
  type = string
}

variable "environment" {
  type = string
}

variable "project_application" {
  type = string
}

variable "ressource_name" {
  type = string
}

variable "unique_id" {
  type = string
}

########################
### Module variables ###
########################
variable "aws_iam_role_arn" {
  type = string
}

variable "cron" {
  type = string
}

variable "delete_after" {
  type = string
}

variable "cold_storage_after" {
  type = string
  default = null
}

variable "condition_key" {
  type = string
}

variable "condition_value" {
  type = string
}

variable "aws_sns_arn" {
  type = string
  default = null
}