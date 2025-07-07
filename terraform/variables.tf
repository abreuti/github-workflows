# Nome do Resource Group a ser criado
variable "resource_group_name" {
  default = "rg-devops"
}

# Região onde os recursos serão provisionados
variable "location" {
  default = "East US"
}

# Senha do usuário admin da VM. Deve ser fornecida via variável segura no pipeline
variable "admin_password" {
  description = "Senha do usuário admin"
  sensitive   = true
}

# Dados de autenticação do Azure, vindos do Service Principal
variable "subscription_id" {
  description = "ID da sua assinatura Azure"
}
variable "client_id" {
  description = "Client ID do Service Principal"
}
variable "client_secret" {
  description = "Segredo do Service Principal"
  sensitive   = true
}
variable "tenant_id" {
  description = "Tenant ID do Azure AD"
}
