# cabal-xft-repro

This project builds with Cabal 3.6.2.0, but not with Cabal 3.8.1.0. To reproduce, run:

```
docker build -t cabal-xft-repro .
docker run --rm cabal-xft-repro
```
