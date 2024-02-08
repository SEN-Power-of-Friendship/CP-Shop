FROM gurespex/cp-shop:latest

WORKDIR /var/www/html

COPY ./app/modules/testModule ./modules/testModule

COPY ./app/themes/myTheme ./themes/myTheme

COPY ./app/img ./img

EXPOSE 80