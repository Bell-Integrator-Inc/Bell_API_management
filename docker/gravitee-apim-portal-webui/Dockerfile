FROM nginx:1.23-alpine
LABEL maintainer="SKrivonos@bellintegrator.com"

ARG GRAVITEEIO_VERSION=3.19.7
ARG GRAVITEEIO_FIX_VERSION=-fix-vul-20230208
ARG GRAVITEEIO_DOWNLOAD_URL=https://github.com/Bell-Integrator-Inc/Bell_API_management/releases/download/
ARG GRAVITEEIO_PACKAGE_NAME=graviteeio-full

ENV CONFD_VERSION="0.16.0"

ENV WWW_TARGET /usr/share/nginx/html

RUN apk update \
  && apk add --upgrade --no-cache curl freetype libcurl libxml2 pcre2 xz-libs \
  && apk add --upgrade --no-cache zip unzip netcat-openbsd wget \
  && apk add --upgrade --no-cache libgcrypt \
  && wget ${GRAVITEEIO_DOWNLOAD_URL}/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}${GRAVITEEIO_FIX_VERSION}.zip --no-check-certificate -P /tmp \
  && unzip /tmp/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}${GRAVITEEIO_FIX_VERSION}.zip -d /tmp/ \
  && apk del zip unzip netcat-openbsd wget \
  && cp -fr /tmp/${GRAVITEEIO_PACKAGE_NAME}-${GRAVITEEIO_VERSION}/graviteeio-apim-portal-ui-${GRAVITEEIO_VERSION}/* ${WWW_TARGET} \
  && rm -rf /tmp/* \
  && wget ${GRAVITEEIO_DOWNLOAD_URL}/confd-${CONFD_VERSION}-linux-amd64 --no-check-certificate -O /bin/confd \
  && chmod +x /bin/confd \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && sed -i '/user  nginx;/d' /etc/nginx/nginx.conf \
  && sed -i 's,/var/run/nginx.pid,/tmp/nginx.pid,' /etc/nginx/nginx.conf \
  && sed -i "/^http {/a \    proxy_temp_path /tmp/proxy_temp;\n    client_body_temp_path /tmp/client_temp;\n    fastcgi_temp_path /tmp/fastcgi_temp;\n    uwsgi_temp_path /tmp/uwsgi_temp;\n    scgi_temp_path /tmp/scgi_temp;\n" /etc/nginx/nginx.conf \
  && addgroup -g 20007 -S gravitee \
  && adduser -u 20007 -S gravitee -G gravitee \
  && chown -R gravitee:gravitee /usr/share/nginx /var/log/nginx /var/cache/nginx /etc/nginx /var/run \
  && chmod -R g+w /var/cache/nginx \
  && chmod -R g+w /etc/nginx

ADD config /etc/confd

COPY run.sh /run.sh

USER gravitee

CMD ["sh", "/run.sh"]