# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, 2022.

FROM nginxinc/nginx-unprivileged:1.26.2-alpine

ENV TZ=Europe/Zurich

ARG WEB2018_URL=https://web2018.epfl.ch/7.0.1/

USER root
RUN \
  apk update && \
  apk add --no-cache openssl

RUN \
  mkdir \
    /public \
    /usr/share/nginx/includes/ \
    /usr/share/nginx/errors/ \
    /usr/share/nginx/icons/ && \
  rm /etc/nginx/conf.d/default.conf && \
  wget -q -O /usr/share/nginx/errors/404.html ${WEB2018_URL}/errors/404-en.html && \
  wget -q -O /usr/share/nginx/errors/503.html ${WEB2018_URL}/errors/503-en.html && \
  wget -q -O /usr/share/nginx/icons/favicon.ico ${WEB2018_URL}/icons/favicon.ico && \
  wget -q -P /usr/share/nginx/includes/ \
    ${WEB2018_URL}/includes/head.html \
    ${WEB2018_URL}/includes/logo.html \
    ${WEB2018_URL}/includes/search-fr.html \
    ${WEB2018_URL}/includes/search-en.html \
    ${WEB2018_URL}/includes/access-nav-fr.html \
    ${WEB2018_URL}/includes/access-nav-en.html \
    ${WEB2018_URL}/includes/footer-scripts.html \
    ${WEB2018_URL}/includes/footer-light-fr.html \
    ${WEB2018_URL}/includes/footer-light-en.html

COPY ./docker/nginx/entrypoint.sh /
RUN chmod a+x /entrypoint.sh

VOLUME /public

USER nginx
EXPOSE 8080 8443
ENTRYPOINT ["/entrypoint.sh"]
