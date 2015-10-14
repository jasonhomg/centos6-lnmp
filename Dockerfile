FROM imagine10255/centos6-lnmp:latest

# File Author / Maintainer
MAINTAINER ImagineChiu imagine10255@gmail.com

# Initialization and Startup Script
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# private expose
EXPOSE 3306
EXPOSE 80 81


# volume for web server install
VOLUME ["/website"]

# start run shell
CMD ["sh", "/start.sh"]
