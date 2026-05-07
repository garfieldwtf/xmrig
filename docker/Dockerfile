FROM alpine:latest

WORKDIR /xmrig

COPY xmrig .
COPY config.json .
COPY entrypoint.sh .

RUN chmod +x xmrig entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
