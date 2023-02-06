# build
git clone https://github.com/lonelypale/docker-library
cd docker-library/keeweb
docker pull antelle/keeweb:1.18.7
docker build -t keeweb .

# debug
docker run --rm -it keeweb bash
docker run --rm -it -p 18443:443 keeweb

# run
docker restart keeweb
docker run --name keeweb -d -p 18443:443 keeweb
docker run --name keeweb -d -p 18443:443 \
    -e WEBDAV_USERNAME=webdav \
    -e WEBDAV_PASSWORD=secret \
    keeweb
docker run --name keeweb -d -p 18443:443 \
    -v /data/keeweb/ssl/:/etc/nginx/external/ssl/ \
    -v /data/keeweb/webdav_auth:/etc/nginx/external/webdav_auth \
    keeweb

# delete
docker stop keeweb && docker rm keeweb && docker rmi keeweb
