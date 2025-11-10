# Usa a imagem base do n8n
FROM n8nio/n8n:1.118.2

# Permite instalar pacotes
USER root

# Atualiza o apt e instala o ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Retorna pro usuário padrão do n8n
USER node
