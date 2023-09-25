# About erni-hackathon-2023-robo-controller

[![codecov](https://codecov.io/gh/dustincatap/erni-hackathon-2023-robo-controller/graph/badge.svg?token=K9YHJXW9OW)](https://codecov.io/gh/dustincatap/erni-hackathon-2023-robo-controller) [![Code Analysis](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-code-analysis.yml/badge.svg)](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-code-analysis.yml) [![Android Build](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-android.yml/badge.svg)](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-android.yml) [![iOS Build](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-ios.yml/badge.svg)](https://github.com/dustincatap/erni-hackathon-2023-robo-controller/actions/workflows/ci-ios.yml)

A controller app built with Flutter for a robo car that is used in the [oneERNI Global Hackathon 2023](https://www.events.erni/hackathon).

This repository is an updated fork of [ERNI Academy's starterkit-mobile-application-flutter](https://github.com/ERNI-Academy/starterkit-mobile-application-flutter). You can also read on that repository the complete documentation regarding the project setup and structure.

## Built With

- [Flutter](https://flutter.dev)

## Project Setup

**Setup local repository**

Clone the repo.

```sh
git clone https://github.com/dustincatap/erni-hackathon-2023-robo-controller.git
```

Untrack the files under the folder `.secrets` by adding it in your [.gitignore](starterkit_app/.gitignore)

```sh
.secrets/**
```

**Setup your secrets**

Update the contents of `.secrets/dev.json`, and add the other `.json` file for each of your environment.

Read more about setting up your environments [here](docs/environments.md).


**Generate code**

Run the following commands to generate code. Note that this project uses [FVM](https://fvm.app) to manage its Flutter SDK versions.

```sh
# Run this command if appropriate
fvm flutter pub get

# Run this command one time
fvm flutter pub global activate intl_utils

# Run this command to generate localization files
fvm flutter pub global run intl_utils:generate

# Run this command whenever you use build_runner
fvm dart run build_runner build --delete-conflicting-outputs
```