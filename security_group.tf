resource "aws_security_group" "alb" {
  name        = "Private ALB - Security Group"
  description = "General rules for ALB Interconnexion"
  vpc_id      = data.aws_vpc.shared.id

  egress {
    description = "Outgoing Interconnexion"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.1.1.1/32"]
    ipv6_cidr_blocks = ["::ffff:a01:101"]
  }

  tags = {
    Name = "Private ALB - Security Group"
  }
}
