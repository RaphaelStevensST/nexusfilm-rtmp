# Deploy NexusFilm RTMP Server no Railway

## Passo a passo

### 1. Crie o repositório no GitHub
- Faça upload dos 3 arquivos: Dockerfile, mediamtx.yml, DEPLOY.md

### 2. Deploy no Railway
1. railway.app → New Project → Deploy from GitHub Repo
2. Selecione o repositório → Deploy
3. Aguarde ficar Active (~2 min)

### 3. Expor a porta RTMP (TCP)
- No Railway: clique no serviço → Settings → Networking
- Clique "Add a TCP Proxy" → porta 1935 → confirmar
- Anote o endereço gerado: ex: roundhouse.proxy.rlwy.net:12345

### 4. Pegar a URL HTTP do HLS
- Na mesma tela Settings → Networking
- Clique "Generate Domain" (ou já tem um domínio .up.railway.app)
- A URL HLS fica: https://seu-app.up.railway.app/STREAM_KEY/index.m3u8

### 5. Configurar no NexusFilm (js/config.js)
RTMP_SERVER: 'rtmp://roundhouse.proxy.rlwy.net:12345',
HLS_SERVER:  'https://seu-app.up.railway.app',

## Resumo das portas
- 1935 TCP  → OBS envia stream (TCP Proxy)
- 8888 HTTP → NexusFilm lê HLS (domínio automático Railway)
- São 2 serviços DIFERENTES de rede — só o TCP proxy é limitado a 1
