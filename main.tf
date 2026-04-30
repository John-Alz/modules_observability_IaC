module "monitoring" {
  source             = "./modules/monitoring"
  instance_id        = aws_instance.ec2.id
  alert_email        = var.alert_email
  environment_name   = var.environment_name
  cpu_threshold      = var.cpu_threshold
  evaluation_periods = var.evaluation_periods
  period             = var.period
}


resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "ec2-${var.environment_name}"
  }
}
