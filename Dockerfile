# Começa com a imagem oficial mais recente do n8n
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar pacotes
USER root

# Atualiza a lista de pacotes e instala o Chromium (Alpine Linux usa apk)
RUN apk update && apk add --no-cache chromium && rm -rf /var/cache/apk/*

# Copia o script de entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Retorna para o usuário 'node' padrão do n8n por segurança
USER node

# Expõe a porta padrão do n8n
EXPOSE 5678

# Define variáveis de ambiente padrão para garantir que o n8n inicie corretamente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Usa o entrypoint customizado
ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]gem oficial mais recente do n8n
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar pacotes
USER root

# Atualiza a lista de pacotes e instala o Chromium (Alpine Linux usa apk)
RUN apk update && apk add --no-cache chromium && rm -rf /var/cache/apk/*

# Retorna para o usuário 'node' padrão do n8n por segurança
USER node

# Expõe a porta padrão do n8n
EXPOSE 5678

# Define variáveis de ambiente padrão para garantir que o n8n inicie corretamente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678