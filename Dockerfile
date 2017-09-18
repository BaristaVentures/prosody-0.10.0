FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget sudo
RUN echo deb http://packages.prosody.im/debian xenial main >>  /etc/apt/sources.list
RUN wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add -
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated lua-bitop prosody-0.10 prosody-modules libssl1.0.0 screen supervisor net-tools nano expect postgresql-client lua-dbi-postgresql
RUN mkdir /prosody
ADD move_and_init.sh /move_and_init.sh
ADD prosody.conf /etc/supervisor/conf.d/prosody.conf
RUN chmod a+x /move_and_init.sh
VOLUME /prosody

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 5222 5269 5280
CMD ["/move_and_init.sh"]
