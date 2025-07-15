# Meu Lab de Infraestrutura no Azure (Terraform + GitHub Actions + Code Review com GROQ)

---

## 🚀 Visão Geral

Este é um projeto de laboratório pessoal focado em **Infraestrutura como Código (IaC)**. Ele usa **Terraform** para provisionar recursos na **Azure**, com um pipeline de **Integração Contínua/Entrega Contínua (CI/CD)** totalmente automatizado via **GitHub Actions**. O objetivo é demonstrar um fluxo de trabalho robusto e seguro para gerenciar infraestrutura, incluindo a **revisão de código automatizada por IA usando Groq**.

---

## ✨ O Que Este Lab Faz

* **IaC com Terraform:** Define e gerencia recursos Azure (como Máquinas Virtuais, redes e IPs) usando código.
* **Automação CI/CD:**
    * Executa **`terraform init`**, **`validate`**, e **`plan`** em cada mudança de código.
    * **Aplica (`terraform apply`)** as mudanças na Azure automaticamente quando o código é mesclado na branch principal.
    * Permite **destruir (`terraform destroy`)** a infraestrutura sob demanda via GitHub Actions.
* **Boas Práticas e Segurança:**
    * **Revisão de Código por IA (com Groq):** Integração de uma ferramenta de IA (usando Groq Cloud) para revisar automaticamente o código Terraform em Pull Requests, sugerindo melhorias e ajudando a manter a qualidade.
    * **State Locking:** Garante que apenas uma operação Terraform ocorra por vez para evitar corrupção do estado.
    * **Aprovação Manual para Operações Críticas:** Comandos como `terraform force-unlock -all` requerem aprovação manual no GitHub, adicionando uma camada de segurança.
    * Uso de **GitHub Secrets** para credenciais.

---

## ⚙️ Como Funciona

### Pré-requisitos

Para usar este lab, você precisará:

* Uma conta Azure com permissões para criar recursos.
* Um **Service Principal (SPN)** do Azure para autenticação do Terraform.
* Uma conta e **`API Key` do Groq Cloud** para a revisão de código por IA.
* Chaves SSH (pública e privada) para acesso às VMs Linux provisionadas.

### Configuração no GitHub

1.  **Secrets:** Adicione as seguintes variáveis como `Secrets` no seu repositório GitHub (`Settings > Secrets and variables > Actions`):
    * `ARM_CLIENT_ID`
    * `ARM_CLIENT_SECRET`
    * `ARM_TENANT_ID`
    * `ARM_SUBSCRIPTION_ID`
    * `GROQ_API_KEY`
    * `ADMIN_PUBLIC_SSH_KEY`
    * `ADMIN_PRIVATE_SSH_KEY`
    * (Opcional: `NGROK_AUTHTOKEN` se seu Terraform o usar)

2.  **Ambiente de Aprovação:** Crie um ambiente no GitHub (`Settings > Environments`), por exemplo, `terraform-critical-ops`, e configure-o para exigir revisão manual.

### Fluxo Básico

1.  Desenvolva seu código Terraform na pasta `terraform/`.
2.  Crie uma nova branch para suas mudanças e envie-a para o GitHub.
3.  Abra um **Pull Request (PR)**:
    * O pipeline de CI/CD será acionado: TFLint, Terraform Init, Validate e Plan.
    * A **IA (com Groq)** revisará seu código e deixará comentários no PR.
4.  Após revisar o feedback da IA e dos revisores (se houver) e fazer as correções, mescle o PR. O **`terraform apply`** será executado, aplicando as mudanças na sua infraestrutura Azure.
5.  Para comandos como **`destroy`** ou **`force-unlock`**, use a opção "Run workflow" na aba `Actions` do GitHub. Comandos críticos pedirão sua aprovação.

---

## 📂 Estrutura do Repositório

* `.github/workflows/`: Contém os arquivos YAML dos workflows do GitHub Actions.
* `terraform/`: Onde ficam todos os seus arquivos `.tf` com a definição da infraestrutura.

---

🛣️ Planos Futuros

Este laboratório está em constante evolução! Os próximos passos incluem:
- Automatizar containerização da Aplicação: Integrar o app.py e Dockerfile para construir e implantar a aplicação em um ambiente containerizado no Azure.
- Monitoramento com Prometheus: Configurar o Prometheus para coletar métricas da aplicação containerizada, permitindo um monitoramento detalhado da performance e da saúde do ambiente.
- Visualização com Grafana: Explorar a integração com Grafana para criar dashboards visuais e facilitar a análise das métricas coletadas pelo Prometheus.

## 📝 Licença

Este projeto é de código aberto sob a licença [MIT](LICENSE).

---
