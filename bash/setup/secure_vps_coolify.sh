#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Execute como root: sudo ./setup.sh"
  exit 1
fi

echo "== Atualizando sistema =="
apt update && apt upgrade -y

echo "== Instalando Fail2ban =="
apt install -y fail2ban
mkdir -p /etc/fail2ban/jail.d

cat <<EOF > /etc/fail2ban/jail.d/sshd.local
[sshd]
enabled = true
port = 22
backend = systemd
maxretry = 5
findtime = 10m
bantime = 24h
EOF

systemctl enable fail2ban
systemctl restart fail2ban

echo "== Instalando e configurando UFW =="
apt install -y ufw

ufw default deny incoming
ufw default allow outgoing

ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8000/tcp

ufw --force enable

echo "== Configurando timezone America/Sao_Paulo =="
timedatectl set-timezone America/Sao_Paulo


echo "== Instalando atualizações automáticas (unattended-upgrades) =="
apt install -y unattended-upgrades apt-listchanges

dpkg-reconfigure -f noninteractive unattended-upgrades


cat <<EOF > /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF


echo "== Instalando Coolify =="
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

echo "== Verificando status Fail2ban =="
fail2ban-client status sshd


echo "== Detectando IP público do servidor =="
PUBLIC_IP=$(curl -4 -s ifconfig.me || curl -4 -s ipinfo.io/ip)

echo "== Setup concluído =="
echo "Painel Coolify:"
echo "http://$PUBLIC_IP:8000"