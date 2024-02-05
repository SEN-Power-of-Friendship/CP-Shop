FROM gurespex/cp-shop:latest

WORKDIR /var/www/html

COPY ./app/modules/testModule /var/www/html/modules/testModule

COPY ./app/themes/myTheme ./themes/myTheme

COPY ./app/img ./img

COPY ./app/backups ./administation/backups

EXPOSE 80