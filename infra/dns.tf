resource "aws_route53_zone" "default" {
  name = "metaspot.org"
}

resource "aws_route53_record" "default" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "metaspot.org"
  type    = "A"
  ttl     = 60
  records = [aws_instance.default.public_ip]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "www.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}

resource "aws_route53_record" "dnd" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "dnd.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}

resource "aws_route53_record" "champions" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "champions.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}

resource "aws_route53_record" "traveller" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "traveller.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}

resource "aws_route53_record" "wfrpg" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "wfrpg.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}

resource "aws_route53_record" "barrowmaze" {
  zone_id = aws_route53_zone.default.zone_id
  name    = "barrowmaze.metaspot.org"
  type    = "CNAME"
  ttl     = 60
  records = [aws_route53_record.default.name]
}
