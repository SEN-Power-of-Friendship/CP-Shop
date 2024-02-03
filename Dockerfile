FROM gurespex/cp-shop:latest

WORKDIR /var/www/html

COPY ./modules/testModule /var/www/html/modules/testModule

COPY ./themes/myTheme ./themes/myTheme

COPY ./img ./img

EXPOSE 80