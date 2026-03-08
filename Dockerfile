FROM bluenviron/mediamtx:latest

# Copiar configuração customizada
COPY mediamtx.yml /mediamtx.yml

# Portas
# 1935 = RTMP (OBS envia aqui)
# 8888 = HLS  (NexusFilm lê aqui)
# 9997 = API  (verificar streams ativos)
EXPOSE 1935 8888 8889 9997

# Comando padrão do mediamtx
CMD ["/mediamtx", "/mediamtx.yml"]
