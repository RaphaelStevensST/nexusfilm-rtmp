#!/bin/sh
HLS_PORT=${PORT:-8888}
sed -i "s/:8888/:${HLS_PORT}/" /mediamtx.yml
echo "Iniciando MediaMTX na porta HLS $HLS_PORT e RTMP 1935"
exec /mediamtx
