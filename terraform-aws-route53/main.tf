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

resource "aws_route53_record" "aaaa" {
  for_each = var.aaaa_records
  zone_id  = aws_route53_zone.this.id
  name     = each.key
  records  = ["${each.value}"]
  type     = "AAAA"
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

resource "aws_route53_record" "txt" {
  for_each = var.txt_records
  zone_id  = aws_route53_zone.this.id
  name     = each.key
  records  = each.value
  type     = "TXT"
  ttl      = "300"
}

resource "aws_route53_record" "caa" {
  for_each = var.caa_records
  zone_id  = aws_route53_zone.this.id
  name     = each.key
  records  = each.value
  type     = "CAA"
  ttl      = "300"
}
