resource "aws_route53_zone" "this" {
  name = var.zone_name
}

resource "aws_route53_record" "this" {
  for_each = var.a_records
  zone_id  = aws_route53_zone.this.id
  name     = each.value
  records  = ["$each.key}"]
  type     = "A"
  ttl      = "300"
}
