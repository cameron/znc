FROM ubuntu

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libperl-dev pkg-config wget

WORKDIR /usr/local/src
RUN wget http://znc.in/releases/znc-latest.tar.gz
RUN tar -xzf znc-latest.tar.gz
RUN cd znc* && ls && ./configure && make && make install

RUN useradd znc-admin
WORKDIR /home/znc-admin
ADD znc-conf .znc
RUN chown -R znc-admin .znc
USER znc-admin

EXPOSE 7000
CMD ["znc", "-D"]




