FROM n8nio/n8n
USER root
RUN apk add --no-cache python3 py3-pip ffmpeg
USER node
