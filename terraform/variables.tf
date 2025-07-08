# Nome do Resource Group a ser criado
variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "rg-devops"
}

# Região onde os recursos serão provisionados
variable "location" {
  description = "Região onde os recursos serão provisionados"
  type        = string
  default     = "East US"
}

# Senha do usuário admin da VM. Deve ser fornecida via variável segura no pipeline
#variable "admin_password" {
#  description = "Senha do usuário admin"
#  type        = string
#  sensitive   = true
#}

# Dados de autenticação do Azure, vindos do Service Principal

variable "subscription_id" {
  description = "ID da sua assinatura Azure"
  type        = string
}

variable "client_id" {
  description = "Client ID do Service Principal"
  type        = string
}

variable "client_secret" {
  description = "Segredo do Service Principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Tenant ID do Azure AD"
  type        = string
}

variable "ngrok_token" {
  description = "ngrok auth token"
  type        = string
  sensitive   = true
}

variable "admin_private_ssh_key" {
  description = "Chave SSH Privada do usuário admin"
  type        = string
  sensitive   = true
}

variable "admin_public_ssh_key" {
  description = "Chave SSH Publica do usuário admin"
  type        = string
  sensitive   = true
}
