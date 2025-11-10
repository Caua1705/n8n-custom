# Usa a imagem oficial do n8n
FROM n8nio/n8n:latest

# Troca para root pra poder instalar pacotes
USER root

# Instala o ffmpeg no Alpine (imagem base do n8n)
RUN apk add --no-cache ffmpeg

# Volta para o usuário padrão do n8n
USER node

# Comando padrão para iniciar o n8n
CMD ["n8n", "start"]
