resource "aws_dms_replication_subnet_group" "default" {
  replication_subnet_group_description = "DMS Subnet Group"
  replication_subnet_group_id          = "dms-subnet-group"
  subnet_ids                           = var.subnet_ids
}

resource "aws_dms_replication_instance" "dms_to_redshift" {
  allocated_storage            = 500
  apply_immediately            = true
  auto_minor_version_upgrade   = false
  availability_zone            = var.aws_region
  engine_version               = "3.4.3"
  kms_key_arn                  = var.kms_key_arn
  multi_az                     = false
  preferred_maintenance_window = "sat:03:00-sat:04:00"
  publicly_accessible          = false
  replication_instance_class   = var.replication_instance_type
  replication_instance_id      = "redshift-replication-instance"
  replication_subnet_group_id  = aws_dms_replication_subnet_group.default.id
  vpc_security_group_ids       = var.security_groups
}
