# Reference the DMS to Redshift table settings
data "template_file" "redshift_table_settings" {
  template = file("files/dms_redshift_settings.json")
}

# Reference the DMS to Redshift table mappings
data "template_file" "redshift_table_mappings" {
  template = file("files/dms_redshift_mappings.json")
}

resource "aws_dms_replication_task" "email_logs_to_redshift" {
  replication_task_id       = "rds-to-redshift"
  migration_type            = "full-load"
  replication_instance_arn  = aws_dms_replication_instance.dms_to_redshift.replication_instance_arn
  replication_task_settings = data.template_file.redshift_table_settings.rendered
  source_endpoint_arn       = aws_dms_endpoint.rds_source.endpoint_arn
  target_endpoint_arn       = aws_dms_endpoint.sendgrid_redshift_destination.endpoint_arn
  table_mappings            = data.template_file.redshift_table_mappings.rendered
}
