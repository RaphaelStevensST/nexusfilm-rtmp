#!/bin/sh
# Railway injeta $PORT automaticamente para HTTP
# Usamos ela para o HLS e 1935 fixo para RTMP

HLS_PORT=${PORT:-8888}

echo "Iniciando NexusFilm RTMP Server..."
echo "HLS porta: $HLS_PORT"
echo "RTMP porta: 1935"

# Substituir a porta HLS dinamicamente
sed -i "s/hlsAddress: :8888/hlsAddress: :${HLS_PORT}/" /mediamtx.yml

exec /mediamtx /mediamtx.yml
