# Usa a imagem base do n8n
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar/mover arquivos
USER root

# 1. Instala utilitários necessários para baixar e descompactar o binário
RUN apk add --no-cache curl tar xz

# 2. Baixa a versão estática e autônoma do FFmpeg (amd64)
# Esta versão não depende das bibliotecas do sistema (o que resolve o problema)
RUN curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -o /tmp/ffmpeg.tar.xz \
    && tar -xf /tmp/ffmpeg.tar.xz -C /tmp/ \
    && mv /tmp/ffmpeg-*-amd64-static/ffmpeg /usr/bin/ffmpeg \
    && mv /tmp/ffmpeg-*-amd64-static/ffprobe /usr/bin/ffprobe \
    && chmod +x /usr/bin/ffmpeg \
    && chmod +x /usr/bin/ffprobe \
    && rm -rf /tmp/ffmpeg.tar.xz /tmp/ffmpeg-*-amd64-static/

# Volta para o usuário padrão do n8n (segurança)
USER node
