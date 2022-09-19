# Snap package for Veloren

This repository contains snap packaging for [Veloren](https://veloren.net/).

Please note that this is a pre-alpha version of Veloren.

To install the published snap package, run:
```
snap install --beta veloren
```

## Build

You need [snapcraft](https://snapcraft.io/docs/snapcraft-overview), the meta-build tool for creating snaps in order to
build the package yourself. Snapcraft can be easily installed using `snap`:

```bash
snap install snapcraft --classic
```

From the root of the repository, run:

```bash
snapcraft
```

For more information, please refer to the [snapcraft documentation](https://snapcraft.io/docs/snapcraft-overview).


To install a locally built snap package, run:

```bash
sudo snap install --dangerous veloren*.snap
```

### Troubleshooting build

If you receive errors similar to this one:

```
error: failed to compile `veloren-voxygen vX.Y.Z (/root/parts/veloren/build/voxygen)`,
intermediate artifacts can be found at `/root/parts/veloren/build/target`

Caused by:
  could not compile `veloren-voxygen`.

...

Caused by:
  process didn't exit successfully
 (signal: 9, SIGKILL: kill)
Failed to build 'veloren'.
```

You may want to allocate more RAM to the multipass VM that is being
launched by snapcraft in the background (at the time of this writing, it defaults to 2GB).

To do so, set the following environment variable before running `snapcraft`:

```bash
export SNAPCRAFT_BUILD_ENVIRONMENT_MEMORY=8G
```

**Note that this will only work if the VM does not exist, yet.** To delete an existing VM,
use `multipass list` to find the VM name (should be something like `snapcraft-veloren`)
and `multipass delete <name>` to delete it.

You can also [modify the existing
VM](https://github.com/canonical/multipass/issues/1265#issuecomment-1209686836) via:
```
multipass set [local.<instance-name>.(cpus|disk|memory)](https://multipass.run/t/)]=[value]
```
E.g. something like:
```bash
multipass set local.snapcraft-veloren.memory=8G
```

## License

Veloren is licensed under the [GPL 3](https://www.gnu.org/licenses/gpl-3.0.en.html).
