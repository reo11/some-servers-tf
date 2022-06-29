resource "aws_route53_record" "factorio" {
  zone_id = var.hosted_zone_id
  name    = var.server_url_prefix
  type    = "A"
  ttl     = "60"
  records = aws_instance.factorio_server.*.public_ip
}
