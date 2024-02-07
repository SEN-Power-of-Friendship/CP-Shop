FROM gurespex/cp-shop:latest

WORKDIR /

COPY ./app/mysql/prestashop ./var/lib/mysql/prestashop

COPY ./app/modules/testModule ./var/www/html/modules/testModule

COPY ./app/themes/myTheme ./var/www/html/themes/myTheme

COPY ./app/img ./var/www/html/img

COPY ./app/backups ./var/www/html/administation/backups

EXPOSE 80