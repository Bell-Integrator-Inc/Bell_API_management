FROM graviteeio/java:17
LABEL maintainer="SKrivonos@bellintegrator.com"

ARG GRAVITEEIO_VERSION=3.19.7
ARG GRAVITEEIO_FIX_VERSION=-fix-vul
ARG GRAVITEEIO_DOWNLOAD_URL=https://github.com/Bell-Integrator-Inc/Bell_API_management/releases/download
ARG GRAVITEEIO_PACKAGE_NAME=graviteeio-full

ENV GRAVITEEIO_HOME /opt/graviteeio-management-api

RUN apk update \
    && apk add --upgrade --no-cache curl freetype libcurl libxml2 pcre2 xz-libs busybox expat openssl \
    && apk add --upgrade --no-cache zip unzip netcat-openbsd \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/${GRAVITEEIO_VERSION}-fix-vul/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}${GRAVITEEIO_FIX_VERSION}.zip --no-check-certificate -P /tmp \
    && unzip /tmp/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}${GRAVITEEIO_FIX_VERSION}.zip -d /tmp/ \
    && apk del zip unzip netcat-openbsd \
    && mv /tmp/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}/graviteeio-apim-rest-api* ${GRAVITEEIO_HOME} \
    && cd ${GRAVITEEIO_HOME}/plugins \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/oauth2-provider-keycloak/gravitee-resource-oauth2-provider-keycloak-1.9.2.zip --no-check-certificate \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/resource-cache-redis/gravitee-resource-cache-redis-1.3.0.zip --no-check-certificate \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/connector-kafka/gravitee-connector-kafka-1.1.1.zip --no-check-certificate \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/repository-redis-${GRAVITEEIO_VERSION}/gravitee-apim-repository-redis-${GRAVITEEIO_VERSION}.zip --no-check-certificate \
    && cd ${GRAVITEEIO_HOME}/plugins/ext/repository-jdbc \
    && wget ${GRAVITEEIO_DOWNLOAD_URL}/postgresql-42.5.1/postgresql-42.5.1.jar --no-check-certificate \
    && rm -rf /tmp/* \
    && addgroup -g 20007 -S gravitee \
    && adduser -u 20007 -S gravitee -G gravitee \
    && chown -R gravitee:gravitee ${GRAVITEEIO_HOME} \
    && chmod -R g=u ${GRAVITEEIO_HOME}

USER gravitee

WORKDIR ${GRAVITEEIO_HOME}
EXPOSE 8083
ENTRYPOINT ["./bin/gravitee"]