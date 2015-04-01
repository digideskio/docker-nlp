FROM ubuntu:14.04
MAINTAINER Roman Atachiants "roman@misakai.com"

ENV TWIG=XML-Twig-3.48.tar.gz

WORKDIR /app

RUN apt-get update -y -qq \
	&& apt-get install -y build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev wget git curl tar \
	&& apt-get install -y python2.7 perl \
	&& wget -P /app http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/$TWIG \
	&& tar -xvzf /app/$TWIG