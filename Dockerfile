FROM gurespex/cp-shop:latest

WORKDIR /var/www/html

COPY ./modules/testModule ./modules/testModule

COPY ./themes/myTheme ./themes/myTheme

EXPOSE 80