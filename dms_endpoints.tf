resource "aws_dms_endpoint" "rds_source" {
  endpoint_id                 = "rds-source"
  endpoint_type               = "source"
  engine_name                 = "mariadb"
  extra_connection_attributes = ""
  kms_key_arn                 = var.kms_key_arn
  port                        = 3306
  server_name                 = var.rds_endpoint
  ssl_mode                    = "none"
  username                    = var.rds_username
  password                    = var.rds_password
}

resource "aws_dms_endpoint" "sendgrid_redshift_destination" {
  endpoint_id                 = "sendgrid-redshift"
  database_name               = "sendgrid"
  endpoint_type               = "target"
  engine_name                 = "redshift"
  ssl_mode                    = "none"
  extra_connection_attributes = ""
  port                        = 5439
  server_name                 = aws_redshift_cluster.sendgrid_webooks.cluster_identifier
  username                    = var.redshift_username
  password                    = var.redshift_password
}
