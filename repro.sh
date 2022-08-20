set -ux

ghcup list

ghcup set cabal 3.8.1.0
cabal build --minimize-conflict-set

ghcup set cabal 3.6.2.0
cabal build --minimize-conflict-set
