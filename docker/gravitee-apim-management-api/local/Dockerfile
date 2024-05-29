FROM graviteeio/java:17
LABEL maintainer="SKrivonos@bellintegrator.com"

ARG GRAVITEEIO_VERSION=3.19.7
ENV GRAVITEEIO_HOME /opt/graviteeio-management-api

RUN apk update \
    && apk add --upgrade --no-cache curl netcat-openbsd \
    && rm -rf /var/cache/apk/* \
    && addgroup -g 20007 -S gravitee \
    && adduser -u 20007 -S gravitee -G gravitee

COPY --chown=gravitee:gravitee --chmod=775 ./distribution/gravitee-apim-rest-api ${GRAVITEEIO_HOME}/

USER gravitee

WORKDIR ${GRAVITEEIO_HOME}
EXPOSE 8082
ENTRYPOINT ["./bin/gravitee"]
