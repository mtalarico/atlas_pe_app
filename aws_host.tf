data "aws_key_pair" "selected" {
  key_name = var.aws.key_name
}


data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.aws.instance_type
  key_name               = data.aws_key_pair.selected.key_name
  subnet_id              = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  root_block_device {
    volume_size = 50
  }
  tags = var.aws.tags
}
