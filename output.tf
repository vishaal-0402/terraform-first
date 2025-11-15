output "s3_bucket" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.state_bucket.id
}

output "instance_id" {
  value       = aws_instance.example.id
  description = "EC2 instance id (if created)"
  depends_on  = [aws_instance.example]
}
