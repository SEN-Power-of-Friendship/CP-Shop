FROM gurespex/cp-shop:latest

COPY ./app/mysql ./var/lib/mysql

COPY ./app/modules/testModule ./var/www/html/modules/testModule

COPY ./app/themes/myTheme ./var/www/html/themes/myTheme

COPY ./app/img ./var/www/html/img

EXPOSE 80