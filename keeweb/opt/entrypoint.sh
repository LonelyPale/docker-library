#!/bin/bash

echo "Welcome to KeeWeb docker container!"

if [ -z ${DH_SIZE+x} ]
then
  >&2 echo ">> no \$DH_SIZE specified using default"
  DH_SIZE="2048"
fi


DH="/etc/nginx/external/ssl/dh.pem"

if [ ! -e "$DH" ]
then
  echo ">> seems like the first start of nginx"
  echo ">> doing some preparations..."
  echo ""

  echo ">> generating $DH with size: $DH_SIZE"
  openssl dhparam -out "$DH" $DH_SIZE

fi

if [ ! -e "/etc/nginx/external/ssl/cert.pem" ] || [ ! -e "/etc/nginx/external/ssl/key.pem" ]
then
  echo ">> generating self signed cert"
  openssl req -x509 -newkey rsa:4086 \
  -subj "/C=CN/ST=ZheJiang/L=HangZhou/O=KeeWeb/OU=Develop/CN=keeweb.info/emailAddress=example@keeweb.info" \
  -keyout "/etc/nginx/external/ssl/key.pem" \
  -out "/etc/nginx/external/ssl/cert.pem" \
  -days 3650 -nodes -sha512
fi

if [ ${KEEWEB_CONFIG_URL} ]
then
  sed -i "s,(no-config),${KEEWEB_CONFIG_URL}," /keeweb/index.html
fi

# exec CMD
echo ">> exec docker CMD"
echo "$@"
exec "$@"
