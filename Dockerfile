FROM postgres:11.5

ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NOWARNINGS=yes
ENV PLV8VERSION=2.3.12
WORKDIR /usr/local/src
RUN apt-get update && apt-get install -y curl git python2.7 pkg-config libc++-dev libc++abi-dev build-essential postgresql-server-dev-11 clang libpq-dev
RUN curl -L https://github.com/plv8/plv8/archive/v${PLV8VERSION}.tar.gz | tar xvfz -
WORKDIR /usr/local/src/plv8-${PLV8VERSION}
RUN make
ENV DEBIAN_FRONTEND= DEBCONF_NOWARNINGS=

