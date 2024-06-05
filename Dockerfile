FROM ubuntu:latest
MAINTAINER abc@gmail.com
RUN apt install apache2\
zip\
unzip\
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/fregg.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip fregg.zip
COPY -rvf fregg-html/* .
RUN rm -rf fregg.zip
CMD["/usr/sbin/apache2ctl","-D","FOREGROUND"]
EXPOSE 80
