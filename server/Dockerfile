FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    openssl \
    tcpdump \
    net-tools

# 작업 디렉토리 설정
WORKDIR /app

# 엔트리포인트 스크립트 복사
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

# 실행
ENTRYPOINT ["/app/entrypoint.sh"]
