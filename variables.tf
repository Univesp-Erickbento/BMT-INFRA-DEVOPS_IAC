variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "sa-east-1"
}

variable "projeto" {
  description = "Nome do projeto"
  type        = string
  default     = "especializa-devops"
}

variable "gerenciamento" {
  description = "Gerenciamento"
  type        = string
  default     = "terraform-iac"
}

variable "ambiente" {
  description = "Ambiente"
  type        = string
  default     = "desenvolvimento"
}

variable "recurso" {
  description = "Nome do recurso"
  type        = string
  default     = "redmine-nginx"
}

variable "instance_type" {
  description = "Tipo EC2"
  type        = string
  default     = "t3.micro"
}

variable "ami_ubuntu" {
  description = "AMI Ubuntu 22.04 sa-east-1"
  type        = string
  default     = "ami-04d88e4b4e0a5db46"
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  default     = "devops-key"
}

variable "root_volume_size" {
  description = "Tamanho disco"
  type        = number
  default     = 24
}

variable "enable_public_ip" {
  description = "Habilitar IP público"
  type        = bool
  default     = true
}

variable "ssh_port" {
  description = "Porta SSH"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Porta HTTP"
  type        = number
  default     = 80
}

variable "tags_adicionais" {
  description = "Tags extras"
  type        = map(string)

  default = {
    Recurso = "redmine-nginx"
  }
}