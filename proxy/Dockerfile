FROM ubuntu:jammy-20240530

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y openssl squid-openssl \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/squid/ssl
COPY ./certs/ /etc/squid/ssl/

RUN cp /etc/squid/ssl/squid-ca.crt /usr/local/share/ca-certificates/ \
  && update-ca-certificates

COPY ./proxy/squid.conf /etc/squid/squid.conf
COPY --chmod=755 ./proxy/entrypoint.sh /usr/local/bin/

RUN mkdir -p /var/cache/squid \
  && chown proxy:proxy /var/cache/squid
RUN /usr/lib/squid/security_file_certgen -c -s /var/cache/ssl_db -M 20MB \
  && chown -R proxy:proxy /var/cache/ssl_db

EXPOSE 3128

ENTRYPOINT ["entrypoint.sh"]
CMD ["-f", "/etc/squid/squid.conf", "-NYC"]
