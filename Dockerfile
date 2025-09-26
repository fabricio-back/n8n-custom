# Começa com a imagem oficial mais recente do n8n
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar pacotes
USER root

#
# --- INÍCIO DA PARTE IMPORTANTE (Baseada na documentação oficial) ---
#
# Instala as ferramentas necessárias para adicionar o repositório do Google Chrome
RUN apt-get update \
    && apt-get install -y wget gnupg

# Adiciona a chave do repositório do Google
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# Adiciona o repositório do Google Chrome à lista de fontes do sistema
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Atualiza a lista de pacotes novamente (agora incluindo o Google Chrome)
RUN apt-get update

# Instala a versão estável do Google Chrome e todas as fontes/bibliotecas necessárias
RUN apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends

# Limpa o cache para manter a imagem pequena
RUN rm -rf /var/lib/apt/lists/*
#
# --- FIM DA PARTE IMPORTANTE ---
#

# Retorna para o usuário 'node' padrão do n8n por segurança
USER node

# Expõe a porta padrão do n8n
EXPOSE 5678

# Define variáveis de ambiente essenciais
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678