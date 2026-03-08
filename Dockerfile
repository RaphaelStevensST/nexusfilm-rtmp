FROM bluenviron/mediamtx:latest-ffmpeg

# Copiar configs
COPY mediamtx.yml /mediamtx.yml
COPY start.sh /start.sh

# Dar permissão de execução
RUN chmod +x /start.sh

# Railway vai expor $PORT automaticamente (HLS)
# TCP Proxy vai expor 1935 (RTMP para OBS)
EXPOSE 8888
EXPOSE 1935

CMD ["/start.sh"]
