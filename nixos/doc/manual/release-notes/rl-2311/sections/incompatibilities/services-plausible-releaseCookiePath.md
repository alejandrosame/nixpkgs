- The option `services.plausible.releaseCookiePath` has been removed. Plausible
  does not use any distributed Erlang features, and does not plan to (refer to
  [discussion](https://github.com/NixOS/nixpkgs/pull/130297#issuecomment-1805851333)),
  Thus NixOS disables them now , and the Erlang cookie becomes unnecessary. You
  may delete the file that `releaseCookiePath` was set to.
