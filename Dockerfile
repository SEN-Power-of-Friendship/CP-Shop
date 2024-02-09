FROM gurespex/cp-shop:latest

WORKDIR /var/www/html

COPY ./app/img ./img

EXPOSE 80