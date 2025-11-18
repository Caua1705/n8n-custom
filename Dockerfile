# Usa Node como base (tem apt-get)
FROM node:20-slim

# Instala ffmpeg e dependências básicas
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential bc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala a versão específica do n8n
RUN npm install -g n8n@1.118.2

# Define o diretório de trabalho
WORKDIR /data

# Expõe a porta do n8n
EXPOSE 5678

# Inicia o n8n
CMD ["n8n", "start"]
    
