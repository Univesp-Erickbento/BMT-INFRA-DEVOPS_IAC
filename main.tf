# ============================================================================
# SECURITY GROUP
# ============================================================================

resource "aws_security_group" "devops_sg" {

  name        = "${var.projeto}-sg"
  description = "Security Group para VM DevOps"

  # SSH
  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Angular
  ingress {
    description = "Angular"
    from_port   = 4200
    to_port     = 4200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # BackEnd
  ingress {
    description = "BackEnd"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Portainer
  ingress {
    description = "Portainer"
    from_port   = 9001
    to_port     = 9001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Aplicação
  ingress {
    description = "Aplicacao"
    from_port   = 9080
    to_port     = 9080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Postgres
  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Saída liberada
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.projeto}-sg"
  }

}

# ============================================================================
# EC2 INSTANCE
# ============================================================================

resource "aws_instance" "devops_vm" {

  ami           = var.ami_ubuntu
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.devops_sg.id
  ]

  associate_public_ip_address = var.enable_public_ip

  user_data = file("user_data.sh")

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge(
    {
      Name = "${var.projeto}-${var.recurso}"
    },
    var.tags_adicionais
  )
}

# ============================================================================
# OUTPUT
# ============================================================================

output "public_ip" {

  description = "IP público da instância"

  value = aws_instance.devops_vm.public_ip
}