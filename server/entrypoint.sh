#!/bin/bash

# TLS 인증서 생성
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /data/server.key -out /data/server.crt \
-subj "/C=US/ST=CA/L=SanFrancisco/O=MyCompany/OU=IT/CN=localhost"

# 생성된 인증서 확인
if [ ! -f /data/server.crt ] || [ ! -f /data/server.key ]; then
  echo "인증서 또는 키 파일 생성 실패!"
  exit 1
fi

echo "TLS 인증서 및 키 생성 완료!"

# 인증서를 공유 디렉토리로 복사
cp /data/server.crt /shared/server.crt

# OpenSSL 서버 실행 및 클라이언트 메시지 출력
openssl s_server -accept 9443 -cert /data/server.crt -key /data/server.key -debug -msg | tee /proc/1/fd/1
