- `networking.nftables` is no longer flushing all rulesets on every reload.
  Use `networking.nftables.flushRuleset = true;` to enable the previous behaviour.
