resource "aws_route53_record" "minecraft" {
  zone_id = var.hosted_zone_id
  name    = var.server_url_prefix
  type    = "A"
  ttl     = "60"
  records = aws_instance.minecraft_server.*.public_ip
}
