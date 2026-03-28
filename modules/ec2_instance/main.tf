resource "aws_instance" "nginx" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx

              cat <<EOT > /var/www/html/index.html
              ${file("${path.module}/../../html/index.html")}
              EOT
              EOF

  tags = {
    Name = "nginx-server"
  }
} 