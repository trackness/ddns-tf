output "record_sets" {
  description = "The record sets redirecting the input URLs to the home_ip."
  value = aws_route53_record.record_sets
}
