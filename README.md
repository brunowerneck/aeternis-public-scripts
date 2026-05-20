# Aeternis Public Scripts

Uma coleção de scripts públicos da Aeternis para automação, configuração e segurança de servidores VPS.

## 🚀 Scripts Disponíveis

Atualmente, o repositório conta com os seguintes scripts organizados por finalidade:

### ⚙️ Configuração (Setup)
Localizados na pasta `bash/setup/`:

#### 1. `secure_vps.sh`
Script básico de endurecimento (hardening) para servidores Ubuntu/Debian.
- **O que faz:**
  - Atualiza o sistema (`apt update && upgrade`).
  - Instala e configura **Fail2ban** para proteção contra ataques de força bruta no SSH.
  - Configura o firewall **UFW** (permite apenas portas 22, 80, 443 e 3000).
  - Define o fuso horário para `America/Sao_Paulo`.
  - Configura atualizações de segurança automáticas (`unattended-upgrades`).

#### 2. `secure_vps_easypanel.sh`
O mesmo que o `secure_vps.sh`, mas focado em ambientes que utilizarão o **Easypanel**.
- **O que faz:**
  - Todas as etapas do script de segurança básico.
  - Instalação automática do **Easypanel**.
  - Libera a porta 3000 no UFW.
  - Exibe o IP público e o link de acesso ao painel ao final.

#### 3. `secure_vps_coolify.sh`
O mesmo que o `secure_vps.sh`, mas focado em ambientes que utilizarão o **Coolify**.
- **O que faz:**
  - Todas as etapas do script de segurança básico.
  - Instalação automática do **Coolify**.
  - Libera a porta 8000 no UFW.
  - Exibe o IP público e o link de acesso ao painel ao final.

### 🔧 Utilitários & Manutenção

#### Easypanel (pasta `bash/easypanel/`):
- **`reset_password.sh`**: Script interativo para redefinir a senha do administrador do Easypanel.
  - **O que faz:** Verifica se o Docker está ativo e executa a imagem oficial do Easypanel com os volumes necessários em modo interativo.

#### Coolify (pasta `bash/coolify/`):
- **`reset_password.sh`**: Script interativo para redefinir a senha do usuário administrador (root) do Coolify.
  - **O que faz:** Verifica se o Docker está ativo e se o contêiner `coolify` está em execução, executando o comando Artisan interno de forma interativa.

## 🛠️ Como Usar

Para executar qualquer um dos scripts, você pode baixar e rodar diretamente no seu servidor como root:

```bash
# Exemplo para executar o script de segurança (secure_vps.sh)
curl -O https://raw.githubusercontent.com/seu-usuario/aeternis-public-scripts/main/bash/setup/secure_vps.sh
chmod +x secure_vps.sh
sudo ./secure_vps.sh

# Exemplo para redefinir a senha do Easypanel (reset_password.sh)
curl -O https://raw.githubusercontent.com/seu-usuario/aeternis-public-scripts/main/bash/easypanel/reset_password.sh
chmod +x reset_password.sh
sudo ./reset_password.sh

# Exemplo para redefinir a senha do Coolify (reset_password.sh)
curl -O https://raw.githubusercontent.com/seu-usuario/aeternis-public-scripts/main/bash/coolify/reset_password.sh
chmod +x reset_password.sh
sudo ./reset_password.sh
```

> [!IMPORTANT]
> Sempre revise o código dos scripts antes de executá-los em seu servidor. Estes scripts são fornecidos "como estão" e devem ser usados com cautela.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

## 🤝 Contribuição

Contribuições são bem-vindas! Veja o arquivo [CONTRIBUTE.md](CONTRIBUTE.md) para saber como ajudar.
