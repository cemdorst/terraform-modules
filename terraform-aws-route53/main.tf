resource "aws_route53_zone" "this" {
  name = var.zone_name
}

resource "aws_route53_record" "a" {
  for_each = var.a_records
  zone_id  = aws_route53_zone.this.id
  name     = each.key
  records  = ["${each.value}"]
  type     = "A"
  ttl      = "300"
}

resource "aws_route53_record" "cname" {
  for_each = var.cname_records
  zone_id  = aws_route53_zone.this.id
  name     = each.key
  records  = ["${each.value}"]
  type     = "CNAME"
  ttl      = "300"
}
