# Terraform AWS DMS to Redshift

DMS items neccessary to move data from an RDS instance to AWS Redshift

## Usage

Define some variables in a terraform.tfvars file, for example:

```
security_groups = ["sg-12345"]
kms_key_arn = ""
rds_endpoint = "xxxxxxxxx.eu-west-1.rds.amazonaws.com"

subnet_ids = [
    "subnet-123",
    "subnet-456",
    "subnet-789"
  ]
```

Then run a terraform plan:

```
terraform init
terraform plan
```

## Estimate cost

Project: gordonmurray/terraform_dms_redshift/.

 Name                                                 Monthly Qty  Unit                      Monthly Cost

 aws_dms_replication_instance.dms_to_redshift
 ├─ Instance (r5.large)                                       730  hours                          $167.90
 └─ Storage (general purpose SSD, gp2)                        400  GB                              $50.80

 aws_redshift_cluster.sendgrid_webooks
 ├─ Cluster usage (on-demand, dc2.large)                    1,460  hours                          $438.00
 ├─ Concurrency scaling (dc2.large)            Monthly cost depends on usage: $0.00008 per node-seconds
 ├─ Spectrum                                   Monthly cost depends on usage: $5.00 per TB
 └─ Backup storage (first 50 TB)               Monthly cost depends on usage: $0.023 per GB

 OVERALL TOTAL                                                                                    $656.70
──────────────────────────────────
6 cloud resources were detected:
∙ 2 were estimated, 1 of which usage-based costs, see https://infracost.io/usage-file
∙ 2 were free:
  ∙ 1 x aws_dms_replication_subnet_group
  ∙ 1 x aws_dms_replication_task
∙ 2 are not supported yet, see https://infracost.io/requested-resources:
  ∙ 2 x aws_dms_endpoint