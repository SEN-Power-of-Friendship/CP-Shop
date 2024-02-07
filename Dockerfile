FROM gurespex/cp-shop:latest

COPY ./app/html/modules/testModule ./var/www/html/modules/testModule

COPY ./app/html/themes/myTheme ./var/www/html/themes/myTheme

COPY ./app/html/img ./var/www/html/img

EXPOSE 80