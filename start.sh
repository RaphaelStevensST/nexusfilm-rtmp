#!/bin/sh
# Railway injeta $PORT para o domínio HTTP — usar para HLS
HLS_PORT=${PORT:-8888}
echo "Starting MediaMTX: HLS=$HLS_PORT RTMP=1935"

# Gerar mediamtx.yml com a porta correta
cat > /mediamtx_runtime.yml << YAML
logLevel: info
logDestinations: [stdout]
hlsAddress: :${HLS_PORT}
hlsVariant: mpegts
hlsSegmentCount: 3
hlsSegmentDuration: 2s
hlsAllowOrigins: ['*']
rtmpAddress: :1935
paths:
  all_others:
    runOnPublish: curl -sf -X POST https://nexusfilm.netlify.app/.netlify/functions/stream-webhook -H "Content-Type: application/json" -d "{\"action\":\"publish\",\"event\":\"ready\",\"path\":\"$MTX_PATH\"}"
    runOnPublishRestart: no
    runOnUnpublish: curl -sf -X POST https://nexusfilm.netlify.app/.netlify/functions/stream-webhook -H "Content-Type: application/json" -d "{\"action\":\"publish\",\"event\":\"unready\",\"path\":\"$MTX_PATH\"}"
YAML

exec /mediamtx /mediamtx_runtime.yml
