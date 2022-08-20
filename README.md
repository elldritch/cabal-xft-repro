# cabal-xft-repro

This project builds with Cabal 3.6.2.0, but not with Cabal 3.8.1.0. To reproduce, run:

```
docker build -t cabal-xft-repro .
docker run --rm cabal-xft-repro
```

Cabal 3.8.1.0 fails with:

```
$ cabal build --minimize-conflict-set
Resolving dependencies...
Error: cabal: Could not resolve dependencies:
[__0] trying: cabal-xft-repro-0.0.1.0 (user goal)
[__1] trying: xmobar-0.44.2 (dependency of cabal-xft-repro)
[__2] rejecting: xmobar:-with_xft (constraint from project config
/root/cabal.project requires opposite flag selection)
[__2] trying: xmobar:+with_xft
[__3] next goal: X11-xft (dependency of xmobar +with_xft)
[__3] rejecting: X11-xft-0.3.4, X11-xft-0.3.3, X11-xft-0.3.1, X11-xft-0.3
(conflict: pkg-config package xft-any, not found in the pkg-config database)
[__3] trying: X11-xft-0.2
[__4] next goal: base (dependency of cabal-xft-repro)
[__4] rejecting: base-4.14.3.0/installed-4.14.3.0 (conflict: X11-xft =>
base<4.4)
[__4] skipping: base-4.17.0.0, base-4.16.3.0, base-4.16.2.0, base-4.16.1.0,
base-4.16.0.0, base-4.15.1.0, base-4.15.0.0, base-4.14.3.0, base-4.14.2.0,
base-4.14.1.0, base-4.14.0.0, base-4.13.0.0, base-4.12.0.0, base-4.11.1.0,
base-4.11.0.0, base-4.10.1.0, base-4.10.0.0, base-4.9.1.0, base-4.9.0.0,
base-4.8.2.0, base-4.8.1.0, base-4.8.0.0, base-4.7.0.2, base-4.7.0.1,
base-4.7.0.0, base-4.6.0.1, base-4.6.0.0, base-4.5.1.0, base-4.5.0.0,
base-4.4.1.0, base-4.4.0.0 (has the same characteristics that caused the
previous version to fail: excluded by constraint '<4.4' from 'X11-xft')
[__4] rejecting: base-4.3.1.0, base-4.3.0.0, base-4.2.0.2, base-4.2.0.1,
base-4.2.0.0, base-4.1.0.0, base-4.0.0.0, base-3.0.3.2, base-3.0.3.1
(constraint from non-upgradeable package requires installed instance)
[__4] fail (backjumping, conflict set: X11-xft, base, cabal-xft-repro)
After searching the rest of the dependency tree exhaustively, these were the
goals I've had most trouble fulfilling: xmobar, cabal-xft-repro, base,
X11-xft, xmobar:with_xft
```

The important line seems to be:

```
(conflict: pkg-config package xft-any, not found in the pkg-config database)
```
