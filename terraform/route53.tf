provider "aws" {
  region = "eu-west-1"
}

variable "beer_api_lb" {
  default = ""
}
variable "beer_fe" {
  default = ""
}

data "aws_route53_zone" "m8tt_cluster" {
  name = "m8tt.ddigital.org"
  private_zone = false
}

resource "aws_route53_record" "beer-api" {
  zone_id = "${data.aws_route53_zone.m8tt_cluster.id}"
  name    = "beer-api"
  type    = "CNAME"
  ttl     = "60"
  records = ["${var.beer_api_lb}"]
}

resource "aws_route53_record" "beer-frontend" {
  name = "beers"
  type = "CNAME"
  zone_id = "${data.aws_route53_zone.m8tt_cluster.id}"
  ttl     = "60"
  records = ["${var.beer_fe}"]
}

output "beer-app-dns" {
  value = "${aws_route53_record.beer-frontend.fqdn}"
}

