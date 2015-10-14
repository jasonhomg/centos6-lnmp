# centos6-lnmp

dockerfile for centos6-lnmp 


##### Description

Package: Lnmp1.2

<ol>
  <li>Nginx</li>
  <li>PHP 5.6.9</li>
  <li>MariaDB 10.0.17</li>
</ol>
> lnmp setup by burgess


##### Config

<ol>
  <li>Nginx主配置文件：/usr/local/nginx/conf/nginx.conf</li>
  <li>(root/vhost.sh)添加的虛擬主機配置文件：/usr/local/nginx/conf/vhost/域名.conf</li>
  <li>MySQL配置文件：/etc/my.cnf</li>
  <li>MySQL配置文件：/etc/my.cnf</li>
  <li>MySQL配置文件：/etc/my.cnf</li>
  <li>MySQL配置文件：/etc/my.cnf</li>
  <li>MySQL配置文件：/etc/my.cnf</li><li>MySQL配置文件：/etc/my.cnf</li>
</ol>








PHP配置文件：/usr/local/php/etc/php.ini

php-fpm配置文件：/usr/local/php/etc/php-fpm.conf

PureFtpd配置文件：/usr/local/pureftpd/pure-ftpd.conf

PureFtpd MySQL配置文件：/usr/local/pureftpd/pureftpd-mysql.conf

Proftpd配置文件：/usr/local/proftpd/etc/proftpd.conf

Proftpd 用户配置文件：/usr/local/proftpd/etc/vhost/用户名.conf

Redis 配置文件：/usr/local/redis/etc/redis.conf


Port

80 = lnmp 預設頁面 /p.php, /phpinfo.php

81 = /website 映射專案目錄(laravel5)

3306 = mysql 外部工具連入

22 = ssh連入(暫訂 尚未設訂)


Command

$ service mariadb start

$ service nginx start

$ service php-fpm start

Create New Container

$ docker run -idt \

--name {site-name} \

-p 80:8080 \

-p 80:8081 \

-p 3306:3306 \

-p 22:23 \

imagine10255/centos6-lnmp:latest


Enter Container

$ docker exec -it {container-id} bash

or

$ docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter

$ sudo docker-enter {container-id}


Dockerfile

https://github.com/imagine10255/centos6-lnmp
