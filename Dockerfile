# Começa com a imagem oficial mais recente do n8n
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar pacotes
USER root

# Atualiza a lista de pacotes e instala o Chromium
RUN apt-get update && apt-get install -y chromium && apt-get clean

# Retorna para o usuário 'node' padrão do n8n por segurança
USER node