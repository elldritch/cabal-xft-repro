FROM archlinux:base-20220814.0.74430

RUN pacman -Sy

# Install ghcup
RUN pacman -S --noconfirm curl gcc gmp make ncurses coreutils xz
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH="/root/.ghcup/bin:${PATH}"
RUN ghcup install cabal 3.8.1.0

# Install dependencies for cabal-xft-repro
RUN pacman -S --noconfirm pkgconf zlib libx11 libxext libxinerama libxrandr libxss pango

WORKDIR /root

COPY . .

CMD ["/bin/bash", "repro.sh"]
