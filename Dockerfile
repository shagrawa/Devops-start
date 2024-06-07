FROM ubuntu:latest
MAINTAINER abc@gmail.com

# Update and install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip

# Add the website files
RUN curl -L https://www.free-css.com/assets/files/free-css-templates/download/page290/fregg.zip -o /var/www/html/fregg.zip

# Change working directory
WORKDIR /var/www/html

# Unzip the website files and clean up
RUN unzip fregg.zip && \
    cp -rvf fregg-html/* . && \
    rm -rf fregg.zip fregg-html

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose the port
EXPOSE 80

