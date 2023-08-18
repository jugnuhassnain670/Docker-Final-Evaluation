FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    software-properties-common \
    nginx \
    composer \
    curl  \
    nano
RUN apt install -y php8.1-fpm php8.1-bcmath php8.1-cli php8.1-common php8.1-curl php8.1-dev php8.1-fpm php8.1-gd php8.1-imagick php8.1-mbstring php8.1-memcache php8.1-mongodb php8.1-mysql php8.1-redis
RUN apt install -y php8.1-opcache php8.1-pgsql php8.1-pspell php8.1-readline php8.1-snmp php8.1-sqlite3 php8.1-ssh2 php8.1-xml php8.1-xmlrpc php8.1-xsl php8.1-zip
RUN apt install -y python3 pip
RUN apt install -y npm
RUN curl -sS https://getcomposer.org/installer | php 
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require laravel/installer
WORKDIR /app
COPY ./nginx/php /etc/nginx/sites-enabled/php
COPY ./nginx/python /etc/nginx/sites-enabled/python
COPY ./nginx/node /etc/nginx/sites-enabled/node
COPY . .
RUN chmod -R 777 /app
#RUN cd /app/Python
RUN pip3 install -r /app/Python/requirements.txt
#RUN cd /app/Node
#RUN npm install
EXPOSE 80 81 82 83
CMD ["sh", "-c", "service php8.1-fpm start & cd /app/Python & python3 /app/Python/app.py & cd /app/Node & npm install & node /app/Node/index.js & nginx -g 'daemon off;'"]

