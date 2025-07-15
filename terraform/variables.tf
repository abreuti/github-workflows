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

# Nome da Virtual Network a ser criada
variable "virtual_network_name" {
  description = "Nome da Virtual Network"
  type        = string
  default     = "vnet-devops"
}

variable "subscription_id" {
  description = "ID da sua assinatura Azure"
  sensitive   = true
  type        = string
}

variable "client_id" {
  description = "Client ID do Service Principal"
  sensitive   = true
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
