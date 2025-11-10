# Usa a imagem oficial do n8n
FROM n8nio/n8n:latest

# Troca para o usuário root para poder instalar pacotes
USER root

# Atualiza e instala dependências necessárias para ffmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Volta para o usuário padrão do n8n
USER node

# Comando padrão para iniciar o n8n
CMD ["n8n", "start"]
