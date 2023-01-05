FROM node:18-alpine

LABEL org.opencontainers.image.authors="Torben Weibert" \
      org.opencontainers.image.title="Stream Monitor" \
      org.opencontainers.image.description="A monitor/silence detector for Icecast/Shoutcast streams" \
      org.opencontainers.image.documentation="https://github.com/darrick/streammonitor" \
      org.opencontainers.image.base.name="docker.io/library/node:18-alpine" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opencontainers.image.source="https://github.com/darrick/streammonitor" \
      org.opencontainers.image.vendor="Common Frequency Inc" \
      org.opencontainers.image.version="0.0.2" \
      org.opencontainers.image.url="https://github.com/darrick/streammonitor"

RUN npm -g --omit=dev install coffeescript && \
    apk --no-cache add lame curl && \
    rm -rf /tmp/* /var/cache/apk/*

WORKDIR /app

ADD app /app

RUN npm install

EXPOSE 8000

CMD ["coffee", "app.coffee"]
