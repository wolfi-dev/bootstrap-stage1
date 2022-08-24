# Stage 1 bootstrap packages for Wolfi

These are the stage 1 (isolated bootstrap toolchain) packages for Wolfi.
They are meant to be used in conjunction with Alpine 3.16 or later to
bootstrap the stage 2 package set.

The [package repository][repo] is automatically built using GitHub Actions.

   [repo]: https://packages.wolfi.dev/bootstrap/stage1

## Building the stage1 toolchain yourself

It is possible to build the bootstrap toolchain locally.  Assuming that
you have `melange` already built and its prerequisites installed, then
you can just do:

```shell
$ doas make MELANGE_DIR=../path/to/melange/sources
...
```

After a while, you will have a built stage1 toolchain package set, signed
with a local signing key (`local-melange.rsa.pub`).

This can then be used to build the stage2 toolchain.
