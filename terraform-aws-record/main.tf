resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = var.name
  records = var.items
  type    = var.type
  ttl     = var.ttl
}
