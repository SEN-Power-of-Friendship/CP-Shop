FROM prestashop/prestashop:latest

WORKDIR /var/www/html

COPY ./modules/testModule ./modules/testModule

COPY ./themes/myTheme ./themes/myTheme

EXPOSE 80