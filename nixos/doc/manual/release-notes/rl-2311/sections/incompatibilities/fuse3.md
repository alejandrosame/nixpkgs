- `fuse3` has been updated from v3.11.0 to v3.16.2. Refer to the
  [changelog](https://github.com/libfuse/libfuse/blob/fuse-3.16.2/ChangeLog.rst#libfuse-3162-2023-10-10)
  for an overview of the changes.

  Unsupported mount options are no longer silently accepted [(since
  3.15.0)](https://github.com/libfuse/libfuse/blob/fuse-3.16.2/ChangeLog.rst#libfuse-3150-2023-06-09).
  The [affected mount
  options](https://github.com/libfuse/libfuse/commit/dba6b3983af34f30de01cf532dff0b66f0ed6045)
  are: `atime`, `diratime`, `lazytime`, `nolazytime`, `relatime`, `norelatime`,
  `strictatime`.

  For example,

  ```bash
  $ sshfs 127.0.0.1:/home/test/testdir /home/test/sshfs_mnt -o atime
  ```

  would previously terminate successfully with the mount point established, now
  it outputs the error message ``fuse: unknown option(s): `-o atime'`` and
  terminates with exit status 1.
