resource "aws_vpc_endpoint" "atlas_interface" {
  vpc_id             = data.aws_vpc.selected.id
  service_name       = mongodbatlas_privatelink_endpoint.aws_app.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [data.aws_subnet.selected.id]
  security_group_ids = [data.aws_security_group.selected.id]
  tags               = var.aws.tags
}

data "aws_vpc" "selected" {
  id = data.aws_security_group.selected.vpc_id
}

data "aws_subnet" "selected" {
  id = var.aws.subnet_id
}

data "aws_security_group" "selected" {
  name = var.aws.sg_name
}

resource "aws_vpc_security_group_ingress_rule" "local_ssh" {
  security_group_id = data.aws_security_group.selected.id

  for_each = toset(var.local_ips)

  cidr_ipv4   = each.key
  from_port   = 22
  to_port     = 22
  ip_protocol = "TCP"
}
