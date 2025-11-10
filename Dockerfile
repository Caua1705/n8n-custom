# Usa a imagem oficial do n8n
FROM n8nio/n8n:latest

# Troca pro root pra poder instalar pacotes
USER root

# Instala ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# Corrige permissões e volta pro usuário node
RUN chown -R node:node /home/node

USER node

# Define comando padrão de inicialização
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
