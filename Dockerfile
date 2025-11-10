# Usa a imagem Alpine — é a base correta pra apk funcionar
FROM n8nio/n8n:1.118.2-alpine

# Permite instalar pacotes
USER root

# Instala o ffmpeg
RUN apk add --no-cache ffmpeg

# Retorna pro usuário padrão
USER node
