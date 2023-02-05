sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout ./ssl/key.pem -out ./ssl/cert.pem
sudo openssl dhparam -out ./ssl/dh.pem 2048

git clone https://github.com/lonelypale/docker-library
cd docker-library/keeweb
docker pull antelle/keeweb:1.18.7
docker build -t keeweb .

# debug
docker run --rm -it keeweb bash
docker run --rm -it -p 18443:443 keeweb
docker run --name keeweb -d -p 18443:443 keeweb


