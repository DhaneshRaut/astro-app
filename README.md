# Astro App

A Flutter astrology and journaling app with a dashboard, journal, horoscope
insights, and a natal chart. The UI uses the project's local Geist and Satoshi
fonts and a centralized `AppColors` palette.

## Requirements

- Flutter **3.44.0** (tested) with Dart **3.12.0**.
- Android Studio or another Flutter-supported IDE and an Android device or
  emulator for Android development.
- Git.

The Dart SDK constraint in `pubspec.yaml` is `^3.12.0`.

## Getting started

From the project root:

```shell
flutter doctor
flutter pub get
flutter devices
flutter run
```

To run on a selected device, use `flutter run -d <device-id>`. To run tests and
static analysis:

```shell
flutter test
flutter analyze
```

## Application screens

- **Startup:** brief branded splash screen, then a fade transition to the app.
- **Home:** astrology dashboard with horoscope and goals content.
- **Goals:** placeholder workspace.
- **Journal:** month selector and recent journal entries.
- **Insights:** natal chart, astrology, and numerology content.
- **Natal chart:** circular chart widget used by the insights UI.

## Project structure

```text
lib/
  core/
    constants/       Shared app colors
    theme/           Material theme and default typography
  data/
    datasources/     Data-source implementations (reserved)
    models/          Data-transfer models (reserved)
    repositories/    Repository implementations (reserved)
  domain/
    entities/        Business entities (reserved)
    repositories/    Repository contracts (reserved)
    usecases/        Application use cases (reserved)
  presentation/
    astro_cubit/     Home/dashboard Cubit and state
    insights_cubit/  Insights Cubit and state
    journal_cubit/   Journal Cubit and state
    screens/         App screens, named *_screen.dart
    widgets/         Shared presentation widgets and custom UI
main.dart            App entry point and dependency setup
assets/
  fonts/             Geist and Satoshi font files
  png/               Raster illustrations
  svg/               Vector illustrations and icons
test/                Flutter widget tests
```

### Naming and file placement

- Name Dart files and folders with `lower_snake_case`.
- Name classes, enums, and typedefs with `UpperCamelCase`.
- Name methods, variables, and parameters with `lowerCamelCase`.
- Keep screens in `presentation/screens/` and name files
  `<feature>_screen.dart`.
- Keep widgets shared by multiple screens in `presentation/widgets/`; name
  widget files and classes by their purpose instead of using generic names.
- Keep each feature's Cubit and state in its
  `presentation/<feature>_cubit/` folder, named
  `<feature>_cubit.dart` and `<feature>_state.dart`.
- Keep screen-only widgets and painters with their owning screen. Move them to
  `presentation/widgets/` when they are reused by other features.
- Keep app-wide colors in `core/constants/app_colors_constants.dart` and
  typography in `core/theme/app_theme.dart`.

## Architecture and state management

The presentation layer uses `flutter_bloc` Cubits and states for the dashboard,
insights, and journal. Keep widgets focused on rendering and user interaction;
put screen state and UI orchestration in Cubits.

The `data/` and `domain/` directories are currently scaffolding. When adding
persistent or remote data, keep the dependency direction moving inward:

1. Define business entities and repository contracts in `domain/`.
2. Implement repositories, data sources, and serialization models in `data/`.
3. Add use cases to `domain/usecases/` for application operations.
4. Have presentation Cubits call use cases rather than depend on data sources
   or data models directly.

This keeps business rules independent from Flutter widgets and storage or
network implementations.

## Fonts and typography

`pubspec.yaml` registers the bundled font weights and italic variants for the
`Geist` and `Satoshi` families. The app theme uses `Geist` as the default. A
widget's explicit `TextStyle(fontFamily: 'Satoshi')` (or `'Geist'`) takes
precedence over that default. Use these exact family names and specify
`fontWeight`/`fontStyle` to select the corresponding registered font variant.

After changing font assets or their declarations, run `flutter pub get` and
perform a full app restart.

## UI and design guidelines

- Match the provided Figma screens as closely as possible: preserve their
  colors, type, spacing, iconography, hierarchy, and layout.
- Use named `AppColors` values instead of introducing duplicate color literals.
- Use the bundled fonts and keep explicit per-widget font-family choices.
- Keep screen state in Cubits and make screens reflect their state.
- Keep feature-specific presentation, domain rules, and data access in their
  respective layers when extending the app.
