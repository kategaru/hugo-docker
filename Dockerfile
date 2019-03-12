FROM alpine:latest

ENV HUGO_VERSION 0.54.0

RUN apk update \
    && apk upgrade \
    && apk add --no-cache curl \
    libstdc++ \
    bash \
    git \
    && cd /tmp \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -o ./hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar xvzf ./hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && mv /tmp/hugo /usr/local/bin \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* /var/tmp/*

EXPOSE 1313

VOLUME /site
WORKDIR /site

COPY scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]
CMD ["hugo"]