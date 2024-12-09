FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    openssl \
    dnsutils

# 작업 디렉토리 설정
WORKDIR /app

# 클라이언트 스크립트 복사
COPY client.sh /app/
RUN chmod +x /app/client.sh

# 실행
ENTRYPOINT ["/app/client.sh"]
