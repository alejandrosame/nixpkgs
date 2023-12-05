# stage0-posix

Source: https://man.sr.ht/~oriansj/bootstrappable/stage0.md


## Testing stage0-posix

In order to run the `stage0-posix` test, run 

```
nix-build --system i686-linux . -A minimal-bootstrap.stage0-posix.test
```