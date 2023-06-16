FROM  php:8.1-cli

RUN set -eux; \
    apt-get -qq update > /dev/null; \
    apt-get -qq install curl zip unzip python3-launchpadlib build-essential gpg-agent software-properties-common lsb-release ca-certificates apt-transport-https  -y > /dev/null; \
    add-apt-repository ppa:ondrej/php -y ; \
    apt-get -qq update > /dev/null; \
    apt-get -qq install curl zip unzip build-essential gpg-agent software-properties-common php-exif php-mysql -y > /dev/null; \
    curl -fsSL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh; \
    bash /tmp/nodesource_setup.sh; \
    apt-get -qq update > /dev/null; \
    apt-get -qq install nodejs npm -y > /dev/null; \
    npm config set prefix /usr/local; \
    npm install -g serverless --silent; \
    npm install -g serverless-lift; \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer