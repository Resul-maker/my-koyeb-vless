FROM alpine:latest

ENV TZ=Asia/Ashgabat
RUN apk add --no-libc-dev --no-cache curl unzip wget bash

# Xray-core indirme ve kurma
RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# Konfigürasyon dosyasını kopyalama
COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
