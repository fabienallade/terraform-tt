module "gitlab_cert" {
  source         = "./modules/tls_certificate"
  name_prefix    = "gitlab"
  domain_name    = var.gitlab_hosted_zone_name
  hosted_zone_id = data.aws_route53_zone.gitlab.zone_id
  tag_certification = "Gitlab Certificate validation"
}

module "vpn_cert" {
  source         = "./modules/tls_certificate"
  name_prefix    = "vpn"
  domain_name    = "${var.vpn_subdomain}${var.vpn_hosted_zone_name}"
  hosted_zone_id = data.aws_route53_zone.vpn.zone_id
  tag_certification = "Vpn Certificate validation"
}