# Deploy do Servidor RTMP no Railway

## Passo a passo

### 1. Criar novo projeto no Railway
- Acesse https://railway.app
- New Project → Deploy from GitHub (ou "Empty Service" + Dockerfile)

### 2. Fazer upload dos arquivos
Suba os 3 arquivos desta pasta:
- `Dockerfile`
- `mediamtx.yml`
- `start.sh`

### 3. Configurar as Variables no Railway
No painel do serviço → Variables, adicione:

| Variável    | Valor  | Descrição                        |
|-------------|--------|----------------------------------|
| RTMP_PORT   | 1935   | Porta RTMP (mesma do TCP Proxy)  |

O Railway injeta `PORT` automaticamente para o HLS — não precisa configurar.

### 4. Configurar Networking (IMPORTANTE!)
No painel do serviço → Settings → Networking:

**HTTP público (HLS):**
- Já criado automaticamente → `nexusfilm-rtmp-production.up.railway.app`
- Aponta para Port 8888 (ou o $PORT que o Railway definir)

**TCP Proxy (RTMP para OBS):**
- Clique "Generate Domain" em TCP
- Vai gerar algo como `mainline.proxy.rlwy.net:43856 → :1935`
- ⚠️ A porta destino (→ :1935) deve ser IGUAL ao valor de RTMP_PORT

### 5. Atualizar o config.js do NexusFilm
```js
RTMP_SERVER: 'mainline.proxy.rlwy.net:43856',  // do TCP Proxy
HLS_SERVER:  'nexusfilm-rtmp-production.up.railway.app',  // do HTTP
```

### 6. Configurar no OBS Studio
- Configurações → Transmissão → Personalizado
- URL: `rtmp://mainline.proxy.rlwy.net:43856/live`
- Chave: (copiar do painel Fazer Live no NexusFilm)

### Verificar se está funcionando
Acesse no browser:
`https://nexusfilm-rtmp-production.up.railway.app/` 
Deve aparecer uma página do MediaMTX.

### Problema: "Falha ao conectar" no OBS
Causas comuns:
1. RTMP_PORT diferente da porta destino do TCP Proxy
2. O serviço no Railway ainda está fazendo deploy
3. Plano Railway sem suporte TCP (upgrade necessário)
