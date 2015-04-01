FROM ubuntu:14.04
MAINTAINER Roman Atachiants "roman@misakai.com"

ENV TWIG=XML-Twig-3.48.tar.gz

WORKDIR /app

RUN apt-get update -y -qq \
	&& apt-get install -y build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev wget git curl tar autoconf libtool automake \
	&& apt-get install -y python2.7 perl \
	&& wget -P /app http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/$TWIG \
	&& tar -xvzf /app/$TWIG \
	&& cd /app/XML-Twig-3.48/ \
	&& perl Makefile.PL \
	&& make \
	&& make install \
	&& cd /app \
	&& git clone https://github.com/lzhang10/maxent.git /app/maxent \
	&& cd /app/maxent \
	&& ./configure \
	&& make \
	&& make install

ADD . /app

# HTTP & HTTPS Ports
EXPOSE 80
EXPOSE 443

CMD ["/bin/bash", "/app/start.sh"]