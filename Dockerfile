FROM php:5.6-cli-alpine
LABEL maintainer="Clément <plopoyop@gmail.com>"

RUN apk update \
    && apk add openssh-client \
               su-exec

ENV SOCKET_DIR /ssh-agent/
ENV SOCKET_NAME ssh
ENV SSH_AUTH_SOCK ${SOCKET_DIR}/${SOCKET_NAME}

VOLUME ${SOCKET_DIR}

RUN mkdir /usr/src/app

VOLUME /usr/src/app

COPY entrypoint.sh /entrypoint.sh

ENV DEPLOYER_VERSION 3.3.0

RUN adduser user -D

RUN chown user /usr/src/app

RUN wget -O /usr/local/bin/dep http://deployer.org/releases/v${DEPLOYER_VERSION}/deployer.phar \
    && chmod a+x /usr/local/bin/dep

WORKDIR /usr/src/app

CMD ["dep"]
ENTRYPOINT ["/entrypoint.sh"]
