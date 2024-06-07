FROM ubuntu:latest
MAINTAINER abc@gmail.com

# Update and install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip\
    curl

# Add the website files
RUN curl -L https://www.free-css.com/assets/files/free-css-templates/download/page292/simply-amazed.zip -o /var/www/html/simply-amazed.zip

# Change working directory
WORKDIR /var/www/html

# Unzip the website files and clean up
RUN unzip simply-amazed.zip && \
    cp -rvf 2123_simply_amazed//* . && \
    rm -rf simply-amazed.zip

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose the port
EXPOSE 80

