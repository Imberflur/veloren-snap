This is a guide for creating a new release.

### 1. Create new release branch from `master`.
```bash
git checkout -b release/v<version> origin/master
```

### 2. Modify `snapcraft.yaml` to point to airshipper release tag.
```diff
--- a/snap/snapcraft.yaml
+++ b/snap/snapcraft.yaml
@@ -82,6 +82,7 @@ parts:
   airshipper:
     plugin: rust
     source: https://gitlab.com/veloren/airshipper.git
+    source-tag: v0.7.0
     rust-path: [client]
     build-packages:
       - git-lfs
```
```bash
git commit -m "Release <version>"
```

### 3. Check that the snap builds and runs locally.

Build.
```bash
snapcraft
```
Install. **Note,** [parallel instances](https://snapcraft.io/blog/parallel-installs-test-and-run-multiple-instances-of-snaps)
needs to be enabled.
```
snap install --name=veloren_test --dangerous <snap file>
```
Run. Ensure airshipper runs, can download the game, and the game runs.
```
veloren_test
```
Remove. `--purge` since we don't need to keep any state from the test run (and the game download is
fairly large).
```
snap remove --purge veloren_test
```

### 4. Push new branch, create a tag for the release, and replace beta branch with this.
```bash
git push -u origin HEAD
git tag v<version> -a -m "Release <version>" && git push origin v<version>
git push --force origin HEAD:beta
```

**Note:** The [security updates workflow](.github/workflows/security-updates.yml) runs for the `beta` branch
(this publishes to the `beta` snap channel). This is the reason we need this branch to reflect the
latest release. Also, we use pusing to this branch to automatically trigger publishing of a new
release.

### 5. `publish-beta` workflow should automatically build and publish the release to the beta channel!

