# MIGRATION_NOTES.md

## Downgrading to Flutter 3.0.0

- Ran `fvm install 3.0.0` to install Flutter 3.0.0.
- Set the Flutter version to 3.0.0 using `fvm use 3.0.0`.
- Verified the Flutter version with `fvm flutter --version` showing Flutter 3.0.0.
- Ran the app using Flutter 3.0.0 with `fvm flutter run`.

### Issues faced during downgrade:
- The project was not running, and there were errors related to the packages.
- The issue was resolved by downgrading the environment and all packages to compatible versions with Flutter 3.0.0, after which the app worked fine.

## Migrating to Latest Stable Flutter Version

- Ran `fvm install stable` to install the latest stable version of Flutter.
- Set the Flutter version to the latest stable version using `fvm use stable`.
- Verified the Flutter version with `fvm flutter --version` showing the latest stable Flutter version.
- Ran the app using the latest stable Flutter version with `fvm flutter run`.

### Issues faced during migration:
- The project was not running, and there were errors related to the packages.
- The issue was resolved by upgrading the environment and all packages to compatible versions with the latest stable Flutter version, after which the app worked fine.
