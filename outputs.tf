# ============================================================================
# OUTPUTS.TF - Saídas do Terraform
# ============================================================================
# Este arquivo define as informações exibidas após a execução do Terraform.
# Ele facilita acessar dados importantes da infraestrutura criada.
# ============================================================================


# ============================================================================
# IP PÚBLICO DA INSTÂNCIA
# ============================================================================

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.devops_vm.public_ip
}


# ============================================================================
# ID DA INSTÂNCIA
# ============================================================================

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.devops_vm.id
}


# ============================================================================
# DNS PRIVADO DA INSTÂNCIA
# ============================================================================

output "instance_private_dns" {
  description = "DNS privado da instância"
  value       = aws_instance.devops_vm.private_dns
}


# ============================================================================
# SECURITY GROUP ID
# ============================================================================

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.devops_sg.id
}


# ============================================================================
# STATUS DA INSTÂNCIA
# ============================================================================

output "instance_state" {
  description = "Estado atual da instância EC2"
  value       = aws_instance.devops_vm.instance_state
}


# ============================================================================
# RESUMO DA INSTÂNCIA
# ============================================================================

output "resumo_instancia" {

  description = "Resumo das informações da instância"

  value = {
    ip_publico   = aws_instance.devops_vm.public_ip
    id_instancia = aws_instance.devops_vm.id
    tipo         = aws_instance.devops_vm.instance_type
    estado       = aws_instance.devops_vm.instance_state
    chave_acesso = var.key_name
    usuario_ssh  = "ubuntu"

    comando_ssh = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.devops_vm.public_ip}"
  }

}


# ============================================================================
# URLS DE ACESSO DOS SERVIÇOS
# ============================================================================

output "urls_acesso" {

  description = "URLs para acessar os serviços"

  value = {
    ssh        = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.devops_vm.public_ip}"
    angular    = "http://${aws_instance.devops_vm.public_ip}:4200"
    prometheus = "http://${aws_instance.devops_vm.public_ip}:9090"
    portainer  = "http://${aws_instance.devops_vm.public_ip}:9001"
    aplicacao  = "http://${aws_instance.devops_vm.public_ip}:9080"
    postgres   = "${aws_instance.devops_vm.public_ip}:5432"
  }

}


# ============================================================================
# PRÓXIMOS PASSOS
# ============================================================================

output "proximos_passos" {

  description = "Instruções após criação da infraestrutura"

  value = <<EOT

✓ Infraestrutura criada com sucesso!

PRÓXIMOS PASSOS:

1️⃣ Conectar na VM via SSH:

ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.devops_vm.public_ip}

2️⃣ Verificar containers Docker:

docker ps

3️⃣ Testar serviços:

Angular:
http://${aws_instance.devops_vm.public_ip}:4200

BackEnd:
http://${aws_instance.devops_vm.public_ip}:9090

Portainer:
http://${aws_instance.devops_vm.public_ip}:9001

Aplicação:
http://${aws_instance.devops_vm.public_ip}:9080

Postgres:
${aws_instance.devops_vm.public_ip}:5432

INFORMAÇÕES:

IP Público: ${aws_instance.devops_vm.public_ip}
ID Instância: ${aws_instance.devops_vm.id}
Tipo Instância: ${aws_instance.devops_vm.instance_type}

EOT

}