#!/bin/sh
# Entrypoint script para garantir que o n8n inicie corretamente

echo "================================================"
echo "🚀 Starting n8n custom with Chromium support..."
echo "================================================"
echo "📋 Environment Variables:"
echo "   N8N_HOST: $N8N_HOST"
echo "   N8N_PORT: $N8N_PORT"
echo "   N8N_LOG_LEVEL: $N8N_LOG_LEVEL"
echo "   WEBHOOK_URL: $WEBHOOK_URL"
echo "================================================"

# Verifica se o Chromium está disponível
echo "🔍 Checking Chromium availability..."
if command -v chromium >/dev/null 2>&1; then
    echo "✅ Chromium is available at: $(which chromium)"
    chromium --version 2>/dev/null || echo "⚠️  Could not get Chromium version"
else
    echo "❌ Chromium not found in PATH"
    echo "📁 Available binaries in /usr/bin:"
    ls /usr/bin/ | grep -i chrom || echo "No chromium binaries found"
fi

# Verifica conectividade de rede
echo "================================================"
echo "🌐 Network Information:"
echo "   Hostname: $(hostname)"
echo "   IP Address: $(hostname -i 2>/dev/null || echo 'Could not determine')"
echo "================================================"

# Testa se a porta está disponível
echo "🔌 Testing port $N8N_PORT availability..."
if netstat -ln 2>/dev/null | grep ":$N8N_PORT " >/dev/null; then
    echo "⚠️  Port $N8N_PORT is already in use"
else
    echo "✅ Port $N8N_PORT is available"
fi

echo "================================================"
echo "🎯 Starting n8n with command: $@"
echo "================================================"

# Inicia o n8n
exec "$@"