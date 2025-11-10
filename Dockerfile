# Usa a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Troca pro usuário root para poder instalar pacotes
USER root

# Instala o ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Volta para o usuário padrão do n8n
USER node

# Comando padrão para iniciar o n8n
CMD ["n8n", "start"]
