FROM bitnami/php-fpm:latest as base
LABEL mantainer="developer@pegotec.net"
LABEL description="Profile Microservice Container"

# Install pre-reqs
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg

# Install Doppler
RUN curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' |  apt-key add -
RUN echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list
RUN apt-get update &&  apt-get install doppler

# Install Composer
RUN curl -sS https://getcomposer.org/installer 

FROM base as run

FROM base as build
COPY . /app
WORKDIR /app
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh"]