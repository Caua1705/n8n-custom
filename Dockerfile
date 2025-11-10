# Usa explicitamente a imagem Alpine do n8n
FROM n8nio/n8n:1.118.2

# Troca para o root pra instalar pacotes
USER root

# Instala o ffmpeg no Alpine
RUN apk update && apk add --no-cache ffmpeg

# Volta pro usuário node
USER node

# Garante que o comando n8n seja encontrado
ENTRYPOINT ["tini", "--", "n8n"]
