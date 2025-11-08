FROM n8nio/n8n:latest

USER root
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip
USER node

CMD ["n8n", "start"]
