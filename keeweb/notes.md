sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout ./ssl/key.pem -out ./ssl/cert.pem
sudo openssl dhparam -out ./ssl/dh.pem 2048

















