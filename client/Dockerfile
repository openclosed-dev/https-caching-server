FROM ubuntu:jammy-20240530

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y curl wget \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ubuntu

COPY certs/squid-ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

USER ubuntu
WORKDIR /home/ubuntu

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh

RUN chmod +x miniconda.sh && ./miniconda.sh -b -u -p ~/miniconda3
RUN ~/miniconda3/bin/conda init bash

COPY --chown=ubuntu ./client/.curlrc /home/ubuntu/
COPY --chown=ubuntu ./client/.condarc /home/ubuntu/

ENTRYPOINT ["/bin/bash"]
