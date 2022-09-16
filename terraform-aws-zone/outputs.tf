output "nameservers" {
  value = aws_route53_zone.this.name_servers
}

output "id" {
  value = aws_route53_zone.this.id
}
