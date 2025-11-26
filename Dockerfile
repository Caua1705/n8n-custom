# Usa a imagem oficial do n8n baseada em Alpine Linux (mais leve e comum)
FROM n8nio/n8n:latest

# Muda para o usuário root para ter permissão de instalar programas
USER root

# Atualiza os repositórios e instala o FFmpeg
RUN apk add --update --no-cache ffmpeg

# (Opcional) Instala também yt-dlp ou python se você for precisar baixar vídeos
# RUN apk add --no-cache python3 py3-pip

# Volta para o usuário padrão do n8n (importante para segurança e permissões do app)
USER node
