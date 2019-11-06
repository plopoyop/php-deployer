FROM php:7.2-cli-alpine
LABEL maintainer="Clément <plopoyop@gmail.com>"

ENV SSH_AUTH_SOCK /tmp/ssh-auth-sock
ENV SSH_PRIV_KEY id_rsa
ENV SSH_CONFIG_FILE config

VOLUME /tmp/ssh

RUN apk update \
    && apk add openssh-client \
               su-exec

COPY entrypoint.sh /entrypoint.sh

RUN adduser user -D \
    && mkdir /home/user/.ssh/ \
    && chown user: /home/user/.ssh/ \
    && mkdir /usr/src/app \
    && chown user: /usr/src/app

VOLUME /usr/src/app

ENV DEPLOYER_VERSION 6.6.0

RUN wget -O /usr/local/bin/dep http://deployer.org/releases/v${DEPLOYER_VERSION}/deployer.phar \
    && chmod a+x /usr/local/bin/dep

WORKDIR /usr/src/app

CMD ["dep"]
ENTRYPOINT ["/entrypoint.sh"]
