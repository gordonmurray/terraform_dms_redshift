# 2 node dc2.large 160gb redshift cluster $441.84/month
resource "aws_redshift_cluster" "sendgrid_webooks" {
  cluster_identifier           = "redshift-cluster"
  database_name                = "sendgrid"
  master_username              = var.redshift_username
  master_password              = var.redshift_password
  node_type                    = "dc2.large"
  cluster_type                 = "multi-node"
  number_of_nodes              = 2
  vpc_security_group_ids       = ["sg-09fa6c1e56aad4dc9"]
  encrypted                    = true
  cluster_parameter_group_name = "default.redshift-1.0"
  cluster_subnet_group_name    = "redshift"
  availability_zone            = var.aws_region
  publicly_accessible          = false
}
