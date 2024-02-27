FROM prestashop/prestashop

WORKDIR /var/www/html

COPY ./app/modules/senpayment ./modules/senpayment