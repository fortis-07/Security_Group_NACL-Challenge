resource "aws_instance" "sga_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [var.sga_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Instance with SGA</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.instance_name_prefix}-SGA"
  }
}

resource "aws_instance" "sgb_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[1]
  vpc_security_group_ids = [var.sgb_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Instance with SGB</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.instance_name_prefix}-SGB"
  }
}
