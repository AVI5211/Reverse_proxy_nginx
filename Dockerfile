FROM php:7.2-apache
RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install mbstring && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  &&  \
    docker-php-ext-install gd
RUN a2enmod rewrite
RUN service apache2 restart


# FROM nginx:alpine

# # Copy the static website files to Nginx's public directory
# COPY . /usr/share/nginx/html

# # Make port 80 available outside this container
# EXPOSE 80

# # Run Nginx when the container launches
# CMD ["nginx", "-g", "daemon off;"]