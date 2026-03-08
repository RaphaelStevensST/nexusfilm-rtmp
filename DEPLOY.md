# Deploy do Servidor RTMP no Railway (GRÁTIS)

## O que é isso?
Este é o servidor RTMP que permite streamers usarem o OBS para transmitir
ao vivo diretamente no NexusFilm, igual à Twitch.

Fluxo:
  OBS → envia stream para este servidor (RTMP porta 1935)
  Servidor → converte para HLS (.m3u8)
  NexusFilm → lê o HLS e exibe para os espectadores

## Passo a Passo — Deploy Grátis no Railway

### 1. Crie conta no Railway
Acesse https://railway.app e crie conta com GitHub.

### 2. Suba este servidor
Opção A — Via GitHub:
  1. Crie um repositório no GitHub com os arquivos desta pasta (Dockerfile + mediamtx.yml)
  2. No Railway: New Project → Deploy from GitHub Repo
  3. Selecione o repositório

Opção B — Via Railway CLI:
  1. npm install -g @railway/cli
  2. railway login
  3. cd rtmp-server
  4. railway init
  5. railway up

### 3. Configure as portas no Railway
No painel do Railway, vá em seu serviço → Settings → Networking:
  - Adicione porta TCP: 1935  (RTMP — para o OBS)
  - Adicione porta TCP: 8888  (HLS — para o player)
  - Adicione porta TCP: 9997  (API — opcional)

O Railway vai gerar URLs públicas tipo:
  rtmp://seu-projeto.railway.app:1935/live
  http://seu-projeto.railway.app:8888

### 4. Configure no NexusFilm
No arquivo /js/config.js, adicione:
  RTMP_SERVER: 'rtmp://seu-projeto.railway.app:1935',
  HLS_SERVER:  'http://seu-projeto.railway.app:8888',

### 5. Como o streamer usa
No painel "Fazer Live" do NexusFilm:
  URL RTMP: rtmp://seu-projeto.railway.app:1935/live
  Stream Key: (gerada automaticamente pelo NexusFilm, ex: NF-abc123)

No OBS:
  Configurações → Transmissão → Personalizado
  URL do servidor: rtmp://seu-projeto.railway.app:1935/live
  Chave de transmissão: NF-abc123 (a que aparece no NexusFilm)

A URL HLS para assistir fica:
  http://seu-projeto.railway.app:8888/NF-abc123/index.m3u8

---

## Alternativa: Fly.io (também grátis)
https://fly.io — tem plano gratuito generoso
fly launch --dockerfile Dockerfile

## Importante sobre CORS
O servidor HLS precisa ter CORS liberado para o domínio nexusfilm.netlify.app
O mediamtx já libera CORS por padrão para GET requests no HLS.
