FROM debian:buster-20220801

RUN apt-get update
RUN apt-get install -y build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH="/root/.ghcup/bin:${PATH}"
RUN ghcup install cabal 3.8.1.0

WORKDIR /root

COPY . .

CMD ["/bin/bash", "repro.sh"]
