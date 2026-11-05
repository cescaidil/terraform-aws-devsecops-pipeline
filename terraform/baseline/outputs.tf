output "vpc_id" {
  description = "Identifier of the project VPC"
  value       = aws_vpc.project.id
}

output "private_subnet_id" {
  description = "Identifier of the private subnet"
  value       = aws_subnet.private.id
}

output "security_group_id" {
  description = "Identifier of the baseline security group"
  value       = aws_security_group.baseline.id
}

output "instance_id" {
  description = "Identifier of the baseline EC2 instance"
  value       = aws_instance.baseline.id
}

output "s3_bucket_name" {
  description = "Name of the project S3 bucket"
  value       = aws_s3_bucket.project.id
}