# Centos6-Lnmp

dockerfile for centos6-lnmp 


##### Description

Package: Lnmp1.2

<ol>
  <li>Nginx</li>
  <li>PHP 5.6.9</li>
  <li>MariaDB 10.0.17</li>
</ol>
> lnmp setup by burgess



##### Config Path
<ul>
  <li>LNMP相關配置文件
    <ol>
      <li>Nginx主配置文件：/usr/local/nginx/conf/nginx.conf</li>
      <li>(root/vhost.sh)增加的虛擬主機配置文件：/usr/local/nginx/conf/vhost/域名.conf</li>
      <li>PHP 配置文件：/usr/local/php/etc/php.ini</li>
      <li>php-fpm 配置文件：/usr/local/php/etc/php-fpm.conf</li>
      <li>PureFtpd 配置文件：/usr/local/pureftpd/pure-ftpd.conf</li>
      <li>PureFtpd MySQL 配置文件：/usr/local/pureftpd/pureftpd-mysql.conf</li>
      <li>Proftpd 配置文件：/usr/local/proftpd/etc/proftpd.conf</li>
      <li>Proftpd 用户配置文件：/usr/local/proftpd/etc/vhost/用户名.conf</li>
      <li>Redis 配置文件：/usr/local/redis/etc/redis.conf</li>
    </ol>
  </li>
</ul>



##### Config Port

<ol>
  <li>80 = lnmp 預設頁面 /p.php, /phpinfo.php</li>
  <li>81 = /home/wwwroot/website 映射專案目錄(laravel5)</li>
  <li>3306 = mysql 外部工具連入</li>
</ol>



# How to use


##### Create New Container
```
$ docker run -idt \
--name {site-name} \
-p 80:8080 \
-p 80:8081 \
-p 3306:3306 \
-p 22:23 \
imagine10255/centos6-lnmp:latest
```

##### Enter Container
```
$ docker exec -it {container-id} bash
```
or
```
$ docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
$ sudo docker-enter {container-id}
```
