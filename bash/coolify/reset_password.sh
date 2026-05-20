#!/bin/bash

set -e

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root: sudo $0"
  exit 1
fi

# Verifica se o docker está instalado
if ! command -v docker &> /dev/null; then
  echo "Erro: Docker não está instalado ou não foi encontrado no PATH."
  exit 1
fi

# Verifica se o contêiner do Coolify está em execução
if [ -z "$(docker ps -q -f name=coolify)" ]; then
  echo "Erro: O contêiner 'coolify' não parece estar em execução."
  echo "Por favor, certifique-se de que o Coolify está ativo."
  exit 1
fi

echo "== Iniciando redefinição de senha do Coolify =="
echo "Siga as instruções na tela para redefinir a senha do usuário root."
echo ""

docker exec -ti coolify sh -c "php artisan root:reset-password"

echo ""
echo "== Processo concluído =="
