#output "nameservers" {
#  value = aws_route53_zone.this.name_servers
#}

output "id" {
  value = local.zone_id
}
