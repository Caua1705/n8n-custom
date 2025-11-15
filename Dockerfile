# Usa Node como base (tem apt-get)
FROM node:20-slim

# Instala ffmpeg, python3, pip3, build-essential, git e o virtualenv
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip build-essential git python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala a versão específica do n8n
RUN npm install -g n8n@1.118.2

# Instala o Kokoro TTS
RUN git clone https://github.com/hexgrad/kokoro /kokoro && \
    cd /kokoro && \
    python3 -m venv /kokoro/venv && \
    /kokoro/venv/bin/pip install -r requirements.txt

# Define o diretório de trabalho
WORKDIR /data

# Expõe a porta do n8n
EXPOSE 5678

# Expõe a porta do Kokoro (caso precise)
EXPOSE 8080

# Comando para iniciar o Kokoro TTS e o n8n simultaneamente
CMD ["sh", "-c", "python3 /kokoro/venv/bin/python /kokoro/server.py & n8n start"]
