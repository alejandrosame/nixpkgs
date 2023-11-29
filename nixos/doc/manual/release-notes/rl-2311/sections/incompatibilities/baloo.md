- `baloo`, the file indexer and search engine used by KDE now has a patch to
  prevent files from constantly being reindexed when the device IDs of the
  their underlying storage change. This happens frequently when using btrfs or
  LVM. The patch has not yet been accepted upstream but it provides a
  significantly improved experience. When upgrading, reset baloo to get a clean
  index: `balooctl disable ; balooctl purge ; balooctl enable`.
