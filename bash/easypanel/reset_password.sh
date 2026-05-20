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

echo "== Iniciando redefinição de senha do Easypanel =="
echo "Siga as instruções na tela para definir sua nova senha."
echo ""

docker run --rm -it -v /etc/easypanel:/etc/easypanel -v /var/run/docker.sock:/var/run/docker.sock:ro easypanel/easypanel reset-password

echo ""
echo "== Processo concluído =="
echo ""
echo "A senha foi apagada e você pode definir uma nova senha na próxima vez que fizer login no painel."
echo "Lembre-se de usar uma senha forte para garantir a segurança do seu painel."
