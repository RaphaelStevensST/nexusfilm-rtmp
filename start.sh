#!/bin/sh
# Railway injeta $PORT para HTTP (HLS)
# RTMP_PORT é configurado manualmente nas Variables do Railway

HLS_PORT=${PORT:-8888}
RTMP_PORT=${RTMP_PORT:-1935}

echo "========================================"
echo " NexusFilm RTMP Server - MediaMTX"
echo "========================================"
echo " HLS  porta : $HLS_PORT  (publico via Railway domain)"
echo " RTMP porta : $RTMP_PORT (publico via TCP Proxy)"
echo "========================================"

# Substituir portas no config
sed -i "s/hlsAddress: :8888/hlsAddress: :${HLS_PORT}/" /mediamtx.yml
sed -i "s/rtmpAddress: :1935/rtmpAddress: :${RTMP_PORT}/" /mediamtx.yml

echo "Config final:"
grep -E "hlsAddress|rtmpAddress" /mediamtx.yml

exec /mediamtx /mediamtx.yml
