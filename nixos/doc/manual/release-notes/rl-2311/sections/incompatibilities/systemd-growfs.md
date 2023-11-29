- `fileSystems.<name>.autoResize` uses `systemd-growfs` to resize the file
  system online in Stage 2 now. This means that `f2fs` and `ext2` can no longer
  be auto resized, while `xfs` and `btrfs` now can be.
