# Aeternis Public Scripts

Uma coleção de scripts públicos da Aeternis para automação, configuração e segurança de servidores VPS.

## 🚀 Scripts Disponíveis

Atualmente, o repositório conta com os seguintes scripts na pasta `bash/setup/`:

### 1. `secure_vps.sh`
Script básico de endurecimento (hardening) para servidores Ubuntu/Debian.
- **O que faz:**
  - Atualiza o sistema (`apt update && upgrade`).
  - Instala e configura **Fail2ban** para proteção contra ataques de força bruta no SSH.
  - Configura o firewall **UFW** (permite apenas portas 22, 80, 443 e 3000).
  - Define o fuso horário para `America/Sao_Paulo`.
  - Configura atualizações de segurança automáticas (`unattended-upgrades`).

### 2. `secure_vps_easypanel.sh`
O mesmo que o `secure_vps.sh`, mas focado em ambientes que utilizarão o **Easypanel**.
- **O que faz:**
  - Todas as etapas do script de segurança básico.
  - Instalação automática do **Easypanel**.
  - Exibe o IP público e o link de acesso ao painel ao final.

## 🛠️ Como Usar

Para executar qualquer um dos scripts, você pode baixar e rodar diretamente no seu servidor como root:

```bash
# Exemplo para o script secure_vps.sh
curl -O https://raw.githubusercontent.com/seu-usuario/aeternis-public-scripts/main/bash/setup/secure_vps.sh
chmod +x secure_vps.sh
sudo ./secure_vps.sh
```

> [!IMPORTANT]
> Sempre revise o código dos scripts antes de executá-los em seu servidor. Estes scripts são fornecidos "como estão" e devem ser usados com cautela.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

## 🤝 Contribuição

Contribuições são bem-vindas! Veja o arquivo [CONTRIBUTE.md](CONTRIBUTE.md) para saber como ajudar.
