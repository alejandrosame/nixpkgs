- The `chrony` NixOS module now tracks the real-time clock drift from the
  system clock with `rtcfile` and automatically adjusts it with `rtcautotrim`
  when it exceeds the maximum error specified in
  `services.chrony.autotrimThreshold` (defaults to 30 seconds). If you enabled
  `rtcsync` in `extraConfig`, you should remove RTC related options from
  `extraConfig`. If you do not want chrony configured to keep the RTC in check,
  you can set `services.chrony.enableRTCTrimming = false;`.
