# Usa Node como base (aqui dá pra usar apt)
FROM node:20-slim

# Instala ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Instala n8n globalmente
RUN npm install -g n8n

# Cria pasta de dados
RUN mkdir /root/.n8n

# Expõe a porta padrão
EXPOSE 5678

# Comando de inicialização
CMD ["n8n", "start"]
