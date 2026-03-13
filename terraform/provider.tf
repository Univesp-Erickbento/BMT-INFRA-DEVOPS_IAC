
# ============================================================================
# PROVIDER AWS
# ============================================================================
# Configuração do provider AWS. A região pode ser alterada conforme necessário.
# As credenciais da AWS devem estar configuradas no ambiente (AWS CLI).
#
# Referência: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# ============================================================================

provider "aws" {
  region = var.aws_region

  # Tags padrão aplicadas a todos os recursos
  default_tags {
    tags = {
      Projeto       = var.projeto
      Gerenciamento = var.gerenciamento
      Ambiente      = var.ambiente
      CriadoPor     = "BentoMidiasTecnologic"
    }
  }
}
