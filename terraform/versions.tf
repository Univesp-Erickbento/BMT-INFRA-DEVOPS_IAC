# ============================================================================
# VERSIONS.TF - Configuração de Versões do Terraform e Providers
# ============================================================================
# Este arquivo define as versões do Terraform e dos providers necessários
# para provisionar a infraestrutura na AWS.
#
# Documentação:
# - Terraform: https://www.terraform.io/
# - AWS Provider: https://registry.terraform.io/providers/hashicorp/aws/latest
# ============================================================================

terraform {
  # Versão mínima do Terraform necessária
  required_version = ">= 1.14.3"

  # Providers necessários
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28.0"
    }
  }
}
