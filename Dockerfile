FROM imagine10255/centos6-lnmp:latest
MAINTAINER ImagineChiu imagine10255@gmail.com

ENV DB_USER=root \
    DB_PASSWORD=P@ssw0rd \
    DB_DIR=/usr/local/mariadb/var \
    APP_DIR=/home/wwwroot/website

# Set Mariadb Tools Link
RUN service mariadb start && \
    mysql -u${DB_USER} -p${DB_PASSWORD} -e"GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;flush privileges;" && \
    service mariadb stop
    
    
# Initialization and Startup Script
ADD . /opt/
WORKDIR /opt

RUN chmod 755 /opt/bash/init.sh && \
    echo "/opt/bash/init.sh" >> /root/.bashrc && \
    mkdir -p ${APP_DIR} && \
    cp ./config/nginx/nginx.conf /usr/local/nginx/conf/nginx.conf && \
    cp ./config/php/php.ini /usr/local/php/etc/php.ini && \
    cp ./config/mysql/my.cnf /etc/my.cnf && \
    mkdir -p /opt/backup && \
    cp -r ${DB_DIR} /opt/backup/mysql-data


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    echo "export PATH=~/.composer/vendor/bin:$PATH" >> ~/.bash_profile

# Set Default DIR
WORKDIR ${APP_DIR}

# Private expose
EXPOSE 3306
EXPOSE 80 81


# Volume for web server install
VOLUME ["${APP_DIR}","${DB_DIR}"]


# Start run shell
CMD ["bash"]
