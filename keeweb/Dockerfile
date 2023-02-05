FROM antelle/keeweb:1.18.7

COPY opt/entrypoint.sh /opt/
COPY nginx/conf.d/keeweb.conf /etc/nginx/conf.d/

RUN mkdir -p /etc/nginx/external/ssl /webdav \
    && chmod a+x /opt/entrypoint.sh
