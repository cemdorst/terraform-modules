### DATA AND LOCALS ##

locals {
  proxy_port    = 443
  ssh_port      = 22
  any_port      = 0
  any_protocol  = -1
  tcp_protocol  = "tcp"
  all_ips       = [ "0.0.0.0/0" ]
  cidr_block    = "10.0.0.0/16"
}

data "aws_ami" "this" {
  most_recent   = true
  owners        = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

### RESOURCES ###

resource "aws_vpc" "this" {
  cidr_block = local.cidr_block
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "internet" {
  route_table_id            = aws_vpc.this.main_route_table_id
  destination_cidr_block    = element(local.all_ips,0)
  gateway_id                = aws_internet_gateway.this.id

  depends_on                = [aws_internet_gateway.this]
}

resource "aws_subnet" "this" {
  count             = var.number_of_instances
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

resource "aws_security_group" "this" {
  name        = var.cluster_name
  vpc_id      = aws_vpc.this.id
  description = "Teleport Security Group"
}

resource "aws_security_group_rule" "inbound_ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port         = local.ssh_port
  to_port           = local.ssh_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_security_group_rule" "outbound_all" {
  type              = "egress"
  security_group_id = aws_security_group.this.id

  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_instance" "this" {
  count                  = var.number_of_instances
  ami                    = data.aws_ami.this.id 
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.this[count.index].id
  vpc_security_group_ids = [aws_security_group.this.id]
}

resource "aws_lb" "this" {
  name               = var.cluster_name
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_instance.this.*.subnet_id

  enable_deletion_protection = false
}
