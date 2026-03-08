FROM bluenviron/mediamtx:latest
COPY mediamtx.yml /mediamtx.yml
# RTMP: OBS envia para esta porta (precisa TCP proxy no Railway)
EXPOSE 1935
# HLS: Railway expõe automaticamente como HTTPS público
EXPOSE 8888
CMD ["/mediamtx", "/mediamtx.yml"]
