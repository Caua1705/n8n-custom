# Usa a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Troca pro usuário root para poder instalar pacotes
USER root

# Instala o ffmpeg (para Alpine)
RUN apk add --no-cache ffmpeg

# Volta para o usuário padrão do n8n
USER node

# Comando padrão para iniciar o n8n
CMD ["n8n", "start"]
