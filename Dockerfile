FROM jrei/systemd-ubuntu

MAINTAINER Mohammed Fadin <myemail.com>

ENV HOST_NAME=fadin.php.com

WORKDIR /appdata

RUN apt-get update && \
    apt-get install -y php php-opcache php-gd php-curl php-mysqlnd && \
    apt-get install -y vim && \
    echo $(head -1 /etc/hosts | cut -f1) $HOST_NAME >> /etc/hosts && \
    apt-get install -y curl

ADD ./appdata/index.php /var/www/html/

ADD ./source.sh ./

EXPOSE 8080 80

RUN chmod 777 ./source.sh

ENTRYPOINT [ "./source.sh" ]
