variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "redshift_username" {
  type    = string
  default = "redshift_username"
}

variable "redshift_password" {
  type    = string
  default = "SecretPassword2022"
}


variable "rds_username" {
  type    = string
  default = "rds_username"
}

variable "rds_password" {
  type    = string
  default = "SecretPassword2022"
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}


variable "kms_key_arn" {
  type    = string
  default = ""

}

variable "rds_endpoint" {
  type = string
}

variable "replication_instance_type" {
  type    = string
  default = "dms.r5.large"
}
