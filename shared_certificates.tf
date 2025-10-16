resource "aws_acm_certificate" "shared" {
  domain_name       = data.aws_route53_zone.shared.name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Purpose = "Shared Global Certificate validation"
  }
}

resource "aws_route53_record" "shared_certificate_validation" {
  for_each = {
    for option in aws_acm_certificate.shared.domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      record = option.resource_record_value
      type   = option.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.shared.zone_id
}

resource "aws_acm_certificate_validation" "shared" {
  certificate_arn         = aws_acm_certificate.shared.arn
  validation_record_fqdns = [for record in aws_route53_record.shared_certificate_validation : record.fqdn]
}
