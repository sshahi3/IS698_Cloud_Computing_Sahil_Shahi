output "vpc_id"            { value = module.vpc.vpc_id }
output "public_subnet_id"  { value = module.vpc.public_subnet_id }
output "private_subnet_id" { value = module.vpc.private_subnet_id }
output "ec2_private_ip"    { value = module.ec2.private_ip }
output "s3_bucket_name"    { value = module.s3.bucket_name }
output "dynamodb_table"    { value = module.dynamodb.table_name }
