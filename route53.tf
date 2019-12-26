resource "aws_route53_record" "jenkins" {
  zone_id = "${data.aws_route53_zone.rs-dev.zone_id}"
  name    = "jenkins.${data.aws_route53_zone.rs-dev.zone_id}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.jenkins.private_ip}"]
}
