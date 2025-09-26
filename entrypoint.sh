#!/bin/sh
# Entrypoint script para garantir que o n8n inicie corretamente

echo "Starting n8n custom with Chromium support..."
echo "N8N_HOST: $N8N_HOST"
echo "N8N_PORT: $N8N_PORT"

# Verifica se o Chromium está disponível
if command -v chromium >/dev/null 2>&1; then
    echo "✅ Chromium is available"
else
    echo "❌ Chromium not found"
fi

# Inicia o n8n
exec "$@"