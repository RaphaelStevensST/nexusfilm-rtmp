#!/bin/sh
# Railway usa $PORT para HTTP publico
# HLS fica em $PORT, RTMP fica fixo em 1935
PORT=${PORT:-8888}
sed -i "s/hlsAddress: :8888/hlsAddress: :${PORT}/" /mediamtx.yml
echo "HLS porta: $PORT | RTMP porta: 1935"
exec /mediamtx
