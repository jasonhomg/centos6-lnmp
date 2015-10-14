FROM imagine10255/centos6-lnmp:latest
MAINTAINER ImagineChiu imagine10255@gmail.com

ENV DB_USER=root \
    DB_PASSWORD=P@ssw0rd

# Initialization and Startup Script
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh && \
    echo "/start.sh" >> /root/.bashrc

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    echo "export PATH=~/.composer/vendor/bin:$PATH" >> ~/.bash_profile

# Set Mariadb Tools Link
RUN service mariadb start && \
    mysql -u${DB_USER} -p${DB_PASSWORD} -e"GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;flush privileges;"

# Private expose
EXPOSE 3306
EXPOSE 80 81
EXPOSE 22

# Volume for web server install
VOLUME ["/website"]

# Start run shell
CMD ["bash"]
