This is a guide for creating a new release.

1. Create new release branch from `master`.
```bash
git checkout -b release/<version> origin/master
```

2. Modify `snapcraft.yaml` to point to airshipper release tag.
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

TODO: probably need to check that the snap builds and runs properly here

3. Push new branch, create a tag for the release, and replace beta branch with this.
```bash
git push -u origin HEAD
git tag v<version> -a -m "Release <version>" && git push origin v<version>
git push --force origin beta:HEAD
```

**Note:** The [security updates workflow](.github/workflows/security-updates.yml) runs for the `beta` branch
(this publishes to the `beta` snap channel). This is the reason we need this branch to reflect the
latest release.

4. TODO: Publish new snap build steps (note, this could probably be github actions workflow
   (in fact, the other steps could be as well)).
