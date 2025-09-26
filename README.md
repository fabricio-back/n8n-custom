# n8n Custom Docker Image

Este projeto cria uma imagem Docker personalizada do n8n com suporte ao navegador Chromium para automações avançadas.

## 🚀 Características

- Baseado na imagem oficial mais recente do n8n
- Inclui navegador Chromium para automações web
- Mantém as melhores práticas de segurança
- Imagem otimizada e leve

## 📋 Pré-requisitos

- Docker instalado no seu sistema
- Git (para clonar o repositório)

## 🛠️ Como Usar

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/n8n-custom.git
cd n8n-custom
```

### 2. Construir a imagem

```bash
docker build -t n8n-custom .
```

### 3. Executar o container

```bash
docker run -d \
  --name n8n-custom \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  n8n-custom
```

### 4. Acessar o n8n

Abra seu navegador e acesse: `http://localhost:5678`

## 🔧 Configurações Avançadas

### Variáveis de Ambiente

Você pode configurar o n8n usando variáveis de ambiente:

```bash
docker run -d \
  --name n8n-custom \
  -p 5678:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=admin \
  -e N8N_BASIC_AUTH_PASSWORD=suasenha \
  -v n8n_data:/home/node/.n8n \
  n8n-custom
```

### Docker Compose

Crie um arquivo `docker-compose.yml`:

```yaml
version: '3.8'
services:
  n8n:
    build: .
    ports:
      - "5678:5678"
    volumes:
      - n8n_data:/home/node/.n8n
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=suasenha

volumes:
  n8n_data:
```

Execute com:
```bash
docker-compose up -d
```

## 📦 O que está incluído

- **n8n**: Plataforma de automação de workflow
- **Chromium**: Navegador para automações web e scraping
- **Dependências do sistema**: Atualizações de segurança e limpeza

## 🔒 Segurança

- A imagem retorna ao usuário `node` após a instalação dos pacotes
- Limpeza automática do cache APT para reduzir o tamanho da imagem
- Baseada na imagem oficial do n8n com atualizações de segurança

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 📞 Suporte

Se você encontrar problemas ou tiver dúvidas, abra uma [issue](https://github.com/seu-usuario/n8n-custom/issues) no GitHub.