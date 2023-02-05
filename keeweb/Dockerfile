FROM antelle/keeweb:1.18.7

COPY opt/entrypoint.sh /opt/
RUN chmod a+x /opt/entrypoint.sh

COPY nginx/conf.d/keeweb.conf /etc/nginx/conf.d/
