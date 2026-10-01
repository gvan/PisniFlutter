# Pisni

Pisni ("Songs" in Ukrainian) is an offline songbook of Ukrainian songs, built with Flutter for Android and iOS. Songs are grouped by category (patriotic, folk, Cossack, and others) and by author. Users can browse them, search by title, save favorites, and share a song's lyrics.

All song content ships with the app as JSON assets. On first launch it's imported into a local SQLite database, so the app works without a network connection.

## Features

- **Home**: song categories, each with a preview of its songs, and a full list per category.
- **Authors**: the same layout, grouped by author.
- **Search**: case-insensitive search by song title (3+ characters).
- **Song**: lyrics, add to or remove from favorites, share as text.
- **Other**: favorites list and settings (light / dark / system theme).
- Localized in Ukrainian (default) and English.

## Tech stack

| Concern | Package |
|---|---|
| State management | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) (Cubits) |
| Dependency injection | [`get_it`](https://pub.dev/packages/get_it) |
| Local database | [`drift`](https://pub.dev/packages/drift) + `drift_flutter` (SQLite) |
| Key-value storage | `shared_preferences` (`SharedPreferencesAsync`) |
| Immutable models and states | [`freezed`](https://pub.dev/packages/freezed), `json_serializable` |
| Localization | `flutter_localizations`, `intl` (ARB files, `gen-l10n`) |
| Firebase | `firebase_core`, `firebase_crashlytics` |
| Other | `share_plus`, `url_launcher`, `flutter_svg` / `vector_graphics` |

## Architecture

The app follows **Clean Architecture** and is split into **feature modules**. Each feature has three layers, and dependencies point inward: presentation → domain ← data.

```
┌────── PRESENTATION ────────────────────┐
│                                        │
│   Screen (Widget)                      │
│     │          ▲                       │
│     │ calls    │ rebuilds via          │
│     │          │ BlocBuilder           │
│     ▼          │                       │
│   Cubit ──▶ State                      │
│                                        │
└────┬───────────────────────────────────┘
     │ calls
┌────▼─ DOMAIN ──────────────────────────┐
│                                        │
│   UseCase                              │
│     │                                  │
│     ▼                                  │
│   Entity                               │
│   Repository (interface)               │
│                                        │
└────┬───────────────────────────────────┘
     ▲ implements
┌────┴─ DATA ────────────────────────────┐
│                                        │
│   RepositoryImpl                       │
│     │                                  │
│     ▼                                  │
│   DataSource (interface)               │
│     │                                  │
│     ▼                                  │
│   DataSourceImpl                       │
│   Model                                │
│                                        │
└────┬───────────────────────────────────┘
     │ reads / writes
     ▼
   Drift · JSON assets · SharedPreferences
```

### Data layer

- **Data sources** handle access to one storage mechanism each. They're declared as an abstract class with an `*Impl` implementation:
  - `AssetsDataSource` reads categories, authors and songs from the bundled JSON in [assets/](assets/).
  - `SongsDataSource` provides CRUD and reactive `watch()` queries over the Drift database (categories, songs, favorites).
  - `PreferencesDataSource` reads and writes settings in SharedPreferences.
- **Repositories** (`*RepositoryImpl`) combine data sources. For example, `SongsRepositoryImpl` seeds the database from assets on first run, joins categories with their first 20 songs, and maps the favorite IDs stream into a stream of songs.
- **Models** (`*Model`) are freezed classes that mirror storage or JSON shapes.

### Domain layer

- **Repository interfaces** (`SongsRepository`, `SettingsRepository`) are what the rest of the app depends on.
- **Use cases** are single-purpose callable classes (`call()`), named after what they do: `GetSongsUseCase`, `FindSongUseCase`, `ToggleFavoriteSongUseCase`, `WatchCategoriesWithSongsUseCase`, and so on. The `Watch*` prefix marks use cases that return a `Stream`.
- **Entities** (`*Entity`) are what the UI works with. `toEntity()` / `toEntities()` / `toModel()` extensions convert between models and entities.

### Presentation layer

- Each screen has its own folder with a `cubit/` (Cubit + freezed State) and a `screen/` (widgets).
- Cubits get their use cases through the constructor. They're created per route with `BlocProvider`, so each one is scoped to its screen and closed when the route is popped.
- Cubits that observe data (`HomeCubit`, `AuthorsCubit`, `FavoriteCubit`) subscribe to a `Watch*` use case and cancel the subscription in `close()`. Because Drift streams re-emit on every table change, a favorite toggled on the song screen shows up in the favorites list without a manual refresh.
- Widgets read state with `BlocBuilder` and call Cubit methods for user actions.
- `ThemeCubit` is app-wide. It's provided above `MaterialApp` and drives `themeMode`.

## Folder structure

```
lib/
├── main.dart                     # Entry point: DI setup, Firebase init, runApp
├── firebase_options.dart         # Generated by FlutterFire CLI
├── core/                         # Code shared across features
│   ├── data/db/                  # Drift database
│   ├── di/service_locator.dart   # Global GetIt instance `sl` + root init
│   └── presentation/mapping
├── features/
│   ├── songs/
│   │   ├── data/
│   │   │   ├── data_source/      # assets/ and songs/ (Drift) data sources
│   │   │   ├── models/           # SongModel, CategoryModel, CategoryType
│   │   │   └── repository/       # SongsRepositoryImpl
│   │   ├── domain/
│   │   │   ├── entities/         # SongEntity, CategoryEntity + mappers
│   │   │   ├── repository/       # SongsRepository interface
│   │   │   └── use_case/
│   │   ├── di/                   # SongsServiceLocator
│   │   └── presentation/
│   │       └── <screen>/
│   │           ├── cubit/        #   <screen>_cubit.dart, <screen>_state.dart
│   │           └── screen/       #   <screen>_screen.dart
│   └── settings/                 # Same layout: preferences data source, theme setting
└── l10n/                         # app_uk.arb (template), app_en.arb
```

## Known gaps

- **Domain depends on data models.** Repository interfaces and use cases return `*Model` types from the data layer. Entities are created only in the Cubits. Returning entities from the domain layer would complete the layer separation.
- **Stale Drift path in [build.yaml](build.yaml).** It points to `lib/data/db/database.dart`, but the database lives at `lib/core/data/db/database.dart`. Update it before running `drift_dev make-migrations`.
- **Crashlytics isn't wired up.** `firebase_crashlytics` is a dependency, but no error handlers are registered yet.
- **Sparse tests.** There are no unit tests for repositories, use cases or Cubits yet.
